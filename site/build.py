"""Сборка сайта Pudra Soft из словарей l10n/*.arb в обычные HTML-страницы.

Запуск из корня проекта:
    python site/build.py

Тексты правятся только в site/l10n/app_ru.arb и app_en.arb, оформление в
site/src/style.css, поведение в site/src/site.js. Готовый сайт пишется в
docs/ (папку публикации GitHub Pages) и полностью пересоздаётся при сборке,
кроме файлов из списка KEEP. Нужен только Python 3.8+, без сторонних пакетов.
"""

import datetime
import html
import json
import re
import shutil
import sys
from pathlib import Path

SITE = Path(__file__).resolve().parent
OUT = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else SITE.parent / 'docs'
DOMAIN = 'https://pudra-soft.ru'
GITHUB = 'https://github.com/MiOlika/'
VK_URL = 'https://vk.ru/pudra_soft'
MAX_URL = 'https://max.ru/channel_pudra_soft'

# Файлы в docs/, которые сборка не трогает.
KEEP = {'CNAME'}


# Приложения. Версия здесь запасная: на сайте её заменяет последняя с GitHub.
APPS = [
    dict(key='doska', slug='doska', name='DoSka', repo='DoSka', version='1.0.3.0',
         logo='doska_logo.webp', video='456239019',
         shots=['doska_1.webp', 'doska_2.webp', 'doska_3.webp'],
         category='BusinessApplication'),
    dict(key='timeFiller', slug='time-filler', name='Time Filler', repo='Time-Filler',
         version='0.3.3.0', logo='timefiller_logo.webp', video='456239017',
         shots=['timefiller_1.webp', 'timefiller_2.webp', 'timefiller_3.webp'],
         category='BusinessApplication'),
    dict(key='clipInk', slug='clip-ink', name='Clip Ink', repo='Clip-Ink',
         version='1.0.1.1', logo='clip_ink_logo.webp', video=None,
         shots=['clip_ink_1.webp'], category='MultimediaApplication'),
    dict(key='filmInk', slug='film-ink', name='Film Ink', repo='Film-Ink',
         version='1.0.0.1', logo='film_ink_logo.webp', video=None,
         shots=['film_ink_1.webp'], category='MultimediaApplication'),
    dict(key='pudraSchool', slug='pudra-school', name='Pudra School', repo='Pudra-School',
         version='1.0.0.0', logo='pudra_school_logo.webp', video=None,
         shots=['pudra_school_1.webp', 'pudra_school_2.webp', 'pudra_school_3.webp'],
         category='EducationalApplication'),
]

# Заголовки и описания отдельных страниц приложений для поисковиков.
APP_PAGES = {
    'doska': {
        'ru': ('DoSka — бесплатный конструктор проектов для Windows',
               'DoSka — локальный конструктор проектов для Windows: доски с заметками, иерархические '
               'списки задач (WBS), чек-листы и таймеры. Работает без интернета. Скачать бесплатно.'),
        'en': ('DoSka — free project builder for Windows',
               'DoSka is a local project builder for Windows with note boards, hierarchical task lists '
               '(WBS), checklists, and timers. Works offline. Download for free.'),
    },
    'timeFiller': {
        'ru': ('Time Filler — бесплатный планировщик смен и отпусков для Windows',
               'Time Filler — локальный планировщик для небольших команд: графики смен, учёт отпусков, '
               'запись клиентов и спринты. Работает без интернета. Скачать бесплатно для Windows.'),
        'en': ('Time Filler — free shift and vacation scheduler for Windows',
               'Time Filler is a local scheduler for small teams: shift schedules, vacation tracking, '
               'client bookings, and sprints. Works offline. Free download for Windows.'),
    },
    'clipInk': {
        'ru': ('Clip Ink — бесплатная программа для записи экрана в Windows',
               'Clip Ink — лёгкая программа для записи экрана в Windows: рамка, весь экран или окно, звук '
               'микрофона и системы, рисование и подписи. Сохраняет в MP4. Скачать бесплатно.'),
        'en': ('Clip Ink — free screen recorder for Windows',
               'Clip Ink is a lightweight Windows screen recorder: frame, full screen, or window, '
               'microphone and system audio, drawing and captions. Saves to MP4. Free download.'),
    },
    'filmInk': {
        'ru': ('Film Ink — бесплатный видеоредактор для Windows',
               'Film Ink — простой видеоредактор для Windows: монтаж и склейка видео на таймлайне, музыка, '
               'скорость, яркость и переходы, экспорт в MP4, MKV, WebM и GIF. Скачать бесплатно.'),
        'en': ('Film Ink — free video editor for Windows',
               'Film Ink is a simple video editor for Windows: cut and join clips on a timeline, add music, '
               'adjust speed and color, export to MP4, MKV, WebM, and GIF. Free download.'),
    },
    'pudraSchool': {
        'ru': ('Pudra School — бесплатные обучающие игры для детей на Windows',
               'Pudra School — обучающие игры для детей на Windows: алфавит и цифры, таблица умножения '
               'и клавиатурный тренажёр слепой печати. Без интернета и рекламы. Скачать бесплатно.'),
        'en': ('Pudra School — free learning games for kids on Windows',
               'Pudra School is a set of learning games for kids on Windows: alphabet and numbers, '
               'multiplication table, and a touch typing trainer. Offline, no ads. Free download.'),
    },
}

FEATURES = [('Offline', 'lock'), ('Install', 'bolt'), ('Free', 'money_off'),
            ('Data', 'shield'), ('Windows', 'computer'), ('Support', 'support_agent')]
STEPS = [('dashboard_customize', 1), ('calendar_month', 2), ('videocam', 3)]
BLOG_ICONS = ['auto_stories', 'hourglass_bottom', 'dashboard_customize', 'bar_chart']

# Тексты, которые нужны скрипту (список версий).
JS_STRINGS = [
    'version', 'latestBadge', 'prereleaseBadge', 'whatsNew', 'openRelease', 'fileSize',
    'downloadWithSize', 'collapse', 'showAllVersions', 'allReleasesOnGithub',
    'noVersions', 'versionsError',
]

PAGE = {
    'ru': dict(title='Pudra Soft — бесплатные приложения для Windows: DoSka, Time Filler, Clip Ink, Film Ink, Pudra School',
               description='Pudra Soft — бесплатные локальные приложения для Windows: DoSka для проектов, '
                           'Time Filler для расписаний, Clip Ink для записи экрана, Film Ink для монтажа '
                           'видео и Pudra School для учёбы детей. Работают без интернета и подписок.',
               other='en', other_label='English', locale='ru_RU'),
    'en': dict(title='Pudra Soft — free Windows apps: DoSka, Time Filler, Clip Ink, Film Ink, Pudra School',
               description='Pudra Soft makes free local apps for Windows: DoSka for projects, Time Filler '
                           'for schedules, Clip Ink for screen recording, Film Ink for video editing, and '
                           'Pudra School for kids\' learning. They work offline with no subscription.',
               other='ru', other_label='Русский', locale='en_US'),
}


def esc(text):
    return html.escape(str(text), quote=True)


def icon(name, cls=''):
    used_icons.add(name)
    return f'<svg class="icon {cls}" aria-hidden="true"><use href="#i-{name}"/></svg>'


used_icons = set()


def icon_sprite():
    """Значки из site/icons встраиваются в страницу: без внешних шрифтов и мигания."""
    symbols = []
    for name in sorted(used_icons | {'download', 'open_in_new'}):
        svg = (SITE / 'icons' / f'{name}.svg').read_text(encoding='utf-8')
        inner = re.sub(r'^.*?<svg[^>]*>|</svg>\s*$', '', svg, flags=re.S)
        symbols.append(f'<symbol id="i-{name}" viewBox="0 0 24 24">{inner}</symbol>')
    return '<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0" style="position:absolute" aria-hidden="true">' + ''.join(symbols) + '</svg>\n'


def home_url(lang):
    return '/en/' if lang == 'en' else '/'


def page_url(lang, slug=None):
    """Адрес страницы: главная или страница приложения на нужном языке."""
    return home_url(lang) + (f'{slug}/' if slug else '')


def app_schema(app, s, lang):
    return {
        '@context': 'https://schema.org', '@type': 'SoftwareApplication', 'name': app['name'],
        'description': s[app['key'] + 'Description'], 'applicationCategory': app['category'],
        'operatingSystem': 'Windows 10, Windows 11',
        'url': DOMAIN + page_url(lang, app['slug']),
        'downloadUrl': f"{GITHUB}{app['repo']}/releases/latest",
        'image': f"{DOMAIN}/images/dark/{app['logo']}",
        'offers': {'@type': 'Offer', 'price': '0', 'priceCurrency': 'RUB'},
        'publisher': {'@type': 'Organization', 'name': 'Pudra Soft'},
    }


def load_strings(lang):
    data = json.loads((SITE / 'l10n' / f'app_{lang}.arb').read_text(encoding='utf-8'))
    return {k: v for k, v in data.items() if not k.startswith('@')}


def img(path, alt='', cls='', size=None, lazy=True):
    """Картинка из images/<тема>/. Скрипт меняет папку при смене темы."""
    attrs = f' class="{cls}"' if cls else ''
    if size:
        attrs += f' width="{size[0]}" height="{size[1]}"'
    if lazy:
        attrs += ' loading="lazy" decoding="async"'
    return f'<img src="/images/dark/{path}" alt="{esc(alt)}"{attrs} data-themed>'


def json_ld(data):
    return ('<script type="application/ld+json">'
            + json.dumps(data, ensure_ascii=False).replace('</', '<\\/') + '</script>')


def render_head(lang, title, description, slug=None, schemas=(), preload=None):
    page = PAGE[lang]
    url = DOMAIN + page_url(lang, slug)
    preload_tag = f'<link rel="preload" as="image" href="/images/dark/{preload}">' if preload else ''
    return f'''<!DOCTYPE html>
<html lang="{lang}" data-theme="dark">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{esc(title)}</title>
<meta name="description" content="{esc(description)}">
<meta name="theme-color" content="#1c1430">
<meta name="zen-verification" content="IKgUPuHUrslzpdwdtbsvdzb07ccJZZrnH4loI9osuSdm4Vo2XmVj7oS7Dw145Iha">
<link rel="canonical" href="{url}">
<link rel="alternate" hreflang="ru" href="{DOMAIN}{page_url('ru', slug)}">
<link rel="alternate" hreflang="en" href="{DOMAIN}{page_url('en', slug)}">
<link rel="alternate" hreflang="x-default" href="{DOMAIN}{page_url('ru', slug)}">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Pudra Soft">
<meta property="og:locale" content="{page['locale']}">
<meta property="og:title" content="{esc(title)}">
<meta property="og:description" content="{esc(description)}">
<meta property="og:url" content="{url}">
<meta property="og:image" content="{DOMAIN}/images/dark/mascot.webp">
<link rel="icon" href="/favicon.ico" sizes="48x48">
<link rel="icon" type="image/png" href="/favicon.png" sizes="32x32">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<script>
  (function () {{
    var theme = null;
    try {{ theme = localStorage.getItem('theme'); }} catch (e) {{}}
    if (theme === 'light') document.documentElement.dataset.theme = 'light';
  }})();
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700&display=swap">
<link rel="stylesheet" href="/style.css">
{preload_tag}
{chr(10).join(json_ld(item) for item in schemas)}
</head>
'''


def render_header(lang, s, slug=None):
    """На страницах приложений ссылки разделов ведут на главную."""
    page = PAGE[lang]
    base = home_url(lang) if slug else ''
    nav = [('products', s['navProducts'], 'apps'), ('benefits', s['navBenefits'], 'star'),
           ('about', s['navAbout'], 'info'), ('blog', s['navBlog'], 'auto_stories')]
    links = ''.join(f'<a href="{base}#{target}">{esc(text)}</a>' for target, text, _ in nav)
    sheet_links = ''.join(f'<a href="{base}#{target}">{icon(ic)}{esc(text)}</a>'
                          for target, text, ic in nav + [('contacts', s['navContacts'], 'forum')])
    return f'''<header class="site-header">
<div class="wrap header-row">
<a class="brand" href="{home_url(lang)}">
{img('pudra_soft_logo.webp', '', size=(40, 40), lazy=False)}
<span><span class="brand-name">Pudra Soft</span><br><span class="brand-tagline">{esc(s['brandTagline'])}</span></span>
</a>
<nav class="main-nav" aria-label="{esc(s['menuTooltip'])}">{links}</nav>
<a class="lang-link" href="{page_url(page['other'], slug)}" hreflang="{page['other']}" lang="{page['other']}" title="{esc(s['otherLanguageTooltip'])}">{esc(s['otherLanguageLabel'])}</a>
<button class="icon-btn theme-toggle" type="button" aria-label="{esc(s['lightThemeTooltip'])} / {esc(s['darkThemeTooltip'])}">
{icon('light_mode', 'to-light')}{icon('dark_mode', 'to-dark')}
</button>
<a class="btn header-cta" href="#contacts">{esc(s['contactUs'])}</a>
<button class="icon-btn menu-btn" type="button" aria-label="{esc(s['menuTooltip'])}">{icon('menu')}</button>
</div>
</header>
<dialog class="sheet" id="menu-sheet" aria-label="{esc(s['menuTooltip'])}">
<div class="sheet-handle"></div>
<nav>{sheet_links}</nav>
</dialog>
'''


def render_hero(s):
    return f'''<section class="hero">
<div class="wrap hero-grid">
<div>
<h1>{esc(s['heroTitle'])}</h1>
<p class="hero-lead">{esc(s['heroSubtitle'])}</p>
<div class="hero-actions">
<a class="btn" href="#products">{esc(s['heroActionProducts'])}</a>
<a class="btn btn-outline" href="#about">{esc(s['heroActionAbout'])}</a>
</div>
<p class="hero-badge">{esc(s['heroBadge'])}</p>
</div>
{img('mascot.webp', s['mascotLabel'], 'hero-art', size=(1000, 1000), lazy=False)}
</div>
</section>
'''


def render_gallery(app, s):
    shots = app['shots']
    if not shots:
        # Скриншотов ещё нет: в окне крупно показывается логотип приложения.
        return f'''<div class="gallery">
<div class="gallery-window">
<div class="window-bar"><i></i><i></i><i></i>{esc(app['name'])}</div>
<div class="gallery-view gallery-cover">{img(app.get('cover', app['logo']), app['name'], size=(384, 384))}</div>
</div>
</div>
'''
    slides = ''.join(
        f'<button class="gallery-slide" type="button" aria-label="{esc(s["screenshotLabel"].format(app=app["name"], number=i))}">'
        f'{img(shot, s["screenshotLabel"].format(app=app["name"], number=i), lazy=i > 1)}</button>'
        for i, shot in enumerate(shots, 1))
    controls = ''
    if len(shots) > 1:
        dots = ''.join(
            f'<button type="button" aria-label="{esc(s["screenshotLabel"].format(app=app["name"], number=i))}"></button>'
            for i in range(1, len(shots) + 1))
        controls = (f'<button class="gallery-arrow prev" type="button" aria-label="{esc(s["previousScreenshot"])}" hidden>{icon("chevron_left")}</button>'
                    f'<button class="gallery-arrow next" type="button" aria-label="{esc(s["nextScreenshot"])}">{icon("chevron_right")}</button>')
        dots = f'<div class="gallery-dots">{dots}</div>'
    else:
        dots = ''
    counter = f'&nbsp;/&nbsp;<span class="gallery-counter">1 – {len(shots)}</span>' if len(shots) > 1 else ''
    return f'''<div class="gallery">
<div class="gallery-window">
<div class="window-bar"><i></i><i></i><i></i>{esc(app['name'])}{counter}</div>
<div class="gallery-view">
<div class="gallery-track">{slides}</div>
{controls}
</div>
</div>
{dots}
</div>
'''


def render_app(app, s, selected, lang, standalone=False):
    """Карточка приложения. standalone — на отдельной странице приложения."""
    k = app['key']
    latest = f"{GITHUB}{app['repo']}/releases/latest"
    all_releases = f"{GITHUB}{app['repo']}/releases"
    features = ''.join(f'<li>{icon("check_circle")}<span>{esc(s[f"{k}Feature{i}"])}</span></li>'
                       for i in range(1, 6))
    benefits = ''.join(f'<li>{icon("check")}<span>{esc(s[f"{k}Benefit{i}"])}</span></li>'
                       for i in range(1, 6))
    details = ''.join(f'<p>{esc(p)}</p>' for p in s[k + 'Details'].split('\n\n'))
    faq = ''.join(f'<p class="faq-q">{esc(s[f"{k}Faq{i}Question"])}</p>'
                  f'<p class="faq-a">{esc(s[f"{k}Faq{i}Answer"])}</p>' for i in range(1, 5))
    video = ''
    if app['video']:
        video_url = f"https://vkvideo.ru/video_ext.php?oid=-158779686&id={app['video']}&hd=2"
        video = (f'<a class="btn btn-outline accent-btn" href="{video_url}" target="_blank" rel="noopener">'
                 f'{icon("play_arrow")}{esc(s["watchVideo"])}</a>')
    version_template = esc(s['versionForWindows'])
    heading = 'h1' if standalone else 'h2'
    tab_attrs = ('' if standalone else
                 f'id="panel-{app["slug"]}" role="tabpanel" aria-labelledby="tab-{app["slug"]}"')
    page_link = ('' if standalone else
                 f'<a class="app-page-link" href="{page_url(lang, app["slug"])}">'
                 f'{esc(s["moreAbout"].format(app=app["name"]))}{icon("arrow_forward")}</a>\n')
    is_open = ' open' if standalone else ''
    return f'''<article class="app-card app-{app['slug']}" {tab_attrs} data-app data-repo="{app['repo']}"{'' if selected else ' hidden'}>
<div class="app-main">
<div>
<div class="app-title-row">
{img(app['logo'], '', 'app-logo', size=(60, 60))}
<{heading} class="app-name">{esc(app['name'])}</{heading}>
</div>
<p class="app-subtitle">{esc(s[k + 'Subtitle'])}</p>
<p class="app-description">{esc(s[k + 'Description'])}</p>
<ul class="check-list">{features}</ul>
<div class="app-actions">
<a class="btn accent-btn" href="{latest}" data-download="{app['repo']}">{icon('download')}{esc(s['downloadFree'])}</a>
{video}
</div>
{page_link}<p class="app-platform">{icon('desktop_windows')}<span data-version="{app['repo']}" data-template="{version_template}">{esc(s['versionForWindows'].format(version=app['version']))}</span></p>
</div>
{render_gallery(app, s)}
</div>
<div class="details-list">
<details class="panel"{is_open}>
<summary>{icon('description')}{esc(s['descriptionTitle'])}{icon('expand_more', 'chevron')}</summary>
<div class="panel-body">{details}<ul class="check-list">{benefits}</ul></div>
</details>
<details class="panel">
<summary>{icon('history')}{esc(s['versionsTitle'])}{icon('expand_more', 'chevron')}</summary>
<div class="panel-body versions" data-repo="{app['repo']}" data-all="{all_releases}" data-fallback="{app['version']}">
<p class="versions-loading">{esc(s['loadingVersions'])}</p>
<div class="versions-footer"><a class="text-btn" href="{all_releases}">{icon('open_in_new')}{esc(s['allReleasesOnGithub'])}</a></div>
</div>
</details>
<details class="panel"{is_open}>
<summary>{icon('help')}{esc(s['faqTitle'])}{icon('expand_more', 'chevron')}</summary>
<div class="panel-body">{faq}</div>
</details>
</div>
</article>
'''


def render_products(s, lang):
    tabs = ''.join(f'''<button class="app-tab app-{app['slug']}" id="tab-{app['slug']}" type="button" role="tab" data-slug="{app['slug']}" aria-controls="panel-{app['slug']}" aria-selected="{'true' if i == 0 else 'false'}" tabindex="{0 if i == 0 else -1}">
{img(app['logo'], '', 'app-tab-logo', size=(44, 44))}
<span class="app-tab-text"><span class="app-tab-name">{esc(app['name'])}</span><span class="version-chip" data-version="{app['repo']}">{app['version']}</span></span>
</button>''' for i, app in enumerate(APPS))
    cards = ''.join(render_app(app, s, i == 0, lang) for i, app in enumerate(APPS))
    return f'''<section class="section" id="products">
<div class="wrap">
<h2 class="eyebrow">{esc(s['productsEyebrow'])}</h2>
<div class="app-tabs" role="tablist">{tabs}</div>
{cards}
</div>
</section>
'''


def render_features(s):
    cards = ''.join(f'''<div class="feature-card">
<div class="icon-tile">{icon(ic)}</div>
<h3>{esc(s[f'why{name}Title'])}</h3>
<p>{esc(s[f'why{name}Description'])}</p>
</div>''' for name, ic in FEATURES)
    return f'''<section class="section" id="benefits">
<div class="wrap">
<h2 class="eyebrow">{esc(s['whyUsEyebrow'])}</h2>
<p class="section-subtitle">{esc(s['whyUsSubtitle'])}</p>
<div class="grid">{cards}</div>
</div>
</section>
'''


def render_about(s):
    steps = ''.join(f'''<li><div class="icon-tile">{icon(ic)}</div>
<div><h3>{esc(s[f'aboutStep{n}Title'])}</h3><p>{esc(s[f'aboutStep{n}Detail'])}</p></div></li>'''
                    for ic, n in STEPS)
    return f'''<section class="section" id="about">
<div class="wrap">
<h2 class="eyebrow">{esc(s['aboutEyebrow'])}</h2>
<div class="about-frame">
<div class="about-inner">
<div>
<p class="about-text">{esc(s['aboutText'])}</p>
<ul class="steps">{steps}</ul>
<a class="btn btn-outline" href="#products">{icon('apps')}{esc(s['heroActionProducts'])}</a>
</div>
{img('mascot.webp', s['mascotLabel'], 'about-art', size=(1000, 1000))}
</div>
</div>
</div>
</section>
'''


def render_cta(s):
    buttons = ''.join(
        f'<a class="btn" href="{GITHUB}{app["repo"]}/releases/latest" data-download="{app["repo"]}">'
        f'{icon("download")}{esc(s["downloadApp"].format(app=app["name"]))}</a>' for app in APPS)
    return f'''<section class="section">
<div class="wrap">
<div class="cta">
<div><h2>{esc(s['ctaTitle'])}</h2><p>{esc(s['ctaSubtitle'])}</p></div>
<div class="cta-buttons">{buttons}</div>
</div>
</div>
</section>
'''


def render_blog(s):
    cards = ''
    dialogs = ''
    for i, ic in enumerate(BLOG_ICONS, 1):
        cards += f'''<article class="blog-card">
<div class="blog-cover" style="background: linear-gradient(90deg, var(--blog-{i}), var(--surface-low))">
<span class="blog-tag">{esc(s[f'blog{i}Tag'])}</span>{icon(ic)}</div>
<div class="blog-body"><h3>{esc(s[f'blog{i}Title'])}</h3><p>{esc(s[f'blog{i}Summary'])}</p>
<button class="read-more" type="button" data-dialog="post-{i}">{esc(s['readMore'])}{icon('arrow_forward')}</button></div>
</article>'''
        dialogs += f'''<dialog class="dialog" id="post-{i}" aria-labelledby="post-{i}-title">
<h3 id="post-{i}-title">{esc(s[f'blog{i}Title'])}</h3>
<p>{esc(s[f'blog{i}Content'])}</p>
<div class="dialog-actions"><button class="text-btn" type="button" data-close>{esc(s['close'])}</button></div>
</dialog>'''
    return f'''<section class="section" id="blog">
<div class="wrap">
<h2 class="eyebrow">{esc(s['blogEyebrow'])}</h2>
<div class="grid grid-4">{cards}</div>
{dialogs}
</div>
</section>
'''


def render_partners(s):
    return f'''<section class="section">
<div class="wrap">
<h2 class="eyebrow">{esc(s['partnersEyebrow'])}</h2>
<div class="partners">
<a class="partner-card" href="https://scan-soft.ru/" target="_blank" rel="noopener">
{img('scan_soft_logo.webp', s['partnerScanSoftName'], size=(68, 68))}
<span><strong>{esc(s['partnerScanSoftName'])}</strong><span class="partner-site">scan-soft.ru</span><span>{esc(s['partnerScanSoftDescription'])}</span></span>
</a>
</div>
</div>
</section>
'''


def render_footer(s):
    return f'''<footer class="site-footer" id="contacts">
<div class="wrap">
<div class="footer-brand">{img('pudra_soft_logo.webp', '', size=(35, 35))}Pudra Soft</div>
<div class="footer-line"></div>
<div class="footer-links">
<a href="{VK_URL}" target="_blank" rel="noopener">{icon('group')}{esc(s['vkGroup'])}</a>
<a href="{MAX_URL}" target="_blank" rel="noopener">{icon('chat')}{esc(s['maxChannel'])}</a>
</div>
<p class="copyright">{esc(s['copyright'])}</p>
<p class="footer-note">{esc(s['footerNote'])}</p>
</div>
</footer>
<button class="to-top" type="button" aria-label="{esc(s['backToTop'])}">{icon('arrow_upward')}</button>
<dialog class="lightbox" id="lightbox">
<img alt="">
<button class="icon-btn lightbox-close" type="button" aria-label="{esc(s['close'])}">{icon('close')}</button>
</dialog>
'''


def organization_schema():
    return {
        '@context': 'https://schema.org', '@type': 'Organization', 'name': 'Pudra Soft',
        'url': DOMAIN + '/', 'logo': DOMAIN + '/images/dark/pudra_soft_logo.webp',
        'sameAs': [VK_URL, MAX_URL, 'https://github.com/MiOlika'],
    }


def render_scripts(s):
    js_strings = {key: s[key] for key in JS_STRINGS}
    return ('<script id="site-strings" type="application/json">'
            + json.dumps(js_strings, ensure_ascii=False).replace('</', '<\\/') + '</script>\n'
            + '<script src="/site.js" defer></script>\n</body>\n</html>\n')


def render_home(lang):
    s = load_strings(lang)
    used_icons.clear()
    body = (render_header(lang, s) + '<main>\n'
            + render_hero(s) + render_products(s, lang) + render_features(s) + render_about(s)
            + render_cta(s) + render_blog(s) + render_partners(s) + '</main>\n'
            + render_footer(s))
    page = PAGE[lang]
    schemas = [organization_schema()] + [app_schema(app, s, lang) for app in APPS]
    head = render_head(lang, 'Pudra Soft', page['description'], schemas=schemas,
                       preload='mascot.webp')
    return head + '<body>\n' + icon_sprite() + body + render_scripts(s)


def render_app_page(app, lang):
    """Отдельная страница приложения: для поиска по названию и по теме приложения."""
    s = load_strings(lang)
    used_icons.clear()
    title, description = APP_PAGES[app['key']][lang]
    others = ''.join(f'''<a class="app-link app-{other['slug']}" href="{page_url(lang, other['slug'])}">
{img(other['logo'], '', 'app-tab-logo', size=(44, 44))}
<span><strong>{esc(other['name'])}</strong><span>{esc(s[other['key'] + 'Description'])}</span></span>
</a>''' for other in APPS if other is not app)
    body = (render_header(lang, s, app['slug']) + f'''<main>
<section class="section app-page">
<div class="wrap">
<nav class="crumbs" aria-label="breadcrumbs"><a href="{home_url(lang)}">Pudra Soft</a> / <a href="{home_url(lang)}#products">{esc(s['navProducts'])}</a> / {esc(app['name'])}</nav>
<p class="app-page-lead">{esc(title)}</p>
{render_app(app, s, True, lang, standalone=True)}
</div>
</section>
<section class="section">
<div class="wrap">
<h2 class="eyebrow">{esc(s['otherApps'])}</h2>
<div class="app-links">{others}</div>
</div>
</section>
</main>
''' + render_footer(s))
    breadcrumbs = {
        '@context': 'https://schema.org', '@type': 'BreadcrumbList',
        'itemListElement': [
            {'@type': 'ListItem', 'position': 1, 'name': 'Pudra Soft', 'item': DOMAIN + home_url(lang)},
            {'@type': 'ListItem', 'position': 2, 'name': app['name'],
             'item': DOMAIN + page_url(lang, app['slug'])},
        ],
    }
    faq = {
        '@context': 'https://schema.org', '@type': 'FAQPage',
        'mainEntity': [{'@type': 'Question', 'name': s[f"{app['key']}Faq{i}Question"],
                        'acceptedAnswer': {'@type': 'Answer', 'text': s[f"{app['key']}Faq{i}Answer"]}}
                       for i in range(1, 5)],
    }
    head = render_head(lang, f"{app['name']} | Pudra Soft", description, slug=app['slug'],
                       schemas=[app_schema(app, s, lang), breadcrumbs, faq])
    return head + '<body>\n' + icon_sprite() + body + render_scripts(s)


def write_page(url_path, content):
    target = OUT / url_path.strip('/') / 'index.html'
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(content, encoding='utf-8')


def build():
    OUT.mkdir(parents=True, exist_ok=True)
    for item in OUT.iterdir():
        if item.name in KEEP:
            continue
        shutil.rmtree(item) if item.is_dir() else item.unlink()

    src = SITE / 'src'
    for item in src.iterdir():
        target = OUT / item.name
        shutil.copytree(item, target) if item.is_dir() else shutil.copy2(item, target)

    pages = [None] + [app['slug'] for app in APPS]
    for lang in ('ru', 'en'):
        write_page(page_url(lang), render_home(lang))
        for app in APPS:
            write_page(page_url(lang, app['slug']), render_app_page(app, lang))

    today = datetime.date.today().isoformat()
    urls = ''.join(f'''  <url>
    <loc>{DOMAIN}{page_url(lang, slug)}</loc>
    <lastmod>{today}</lastmod>
    <xhtml:link rel="alternate" hreflang="ru" href="{DOMAIN}{page_url('ru', slug)}"/>
    <xhtml:link rel="alternate" hreflang="en" href="{DOMAIN}{page_url('en', slug)}"/>
  </url>
''' for slug in pages for lang in ('ru', 'en'))
    (OUT / 'sitemap.xml').write_text(
        '<?xml version="1.0" encoding="UTF-8"?>\n'
        '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" '
        'xmlns:xhtml="http://www.w3.org/1999/xhtml">\n' + urls + '</urlset>\n', encoding='utf-8')
    (OUT / 'robots.txt').write_text(
        f'User-agent: *\nAllow: /\n\nSitemap: {DOMAIN}/sitemap.xml\n', encoding='utf-8')
    # Без этого файла GitHub Pages обрабатывает сайт через Jekyll.
    (OUT / '.nojekyll').write_text('', encoding='utf-8')
    print(f'Сайт собран в {OUT}')


if __name__ == '__main__':
    build()
