// Pudra Soft: интерактивность сайта. Весь текст уже есть в HTML,
// скрипт только переключает тему и вкладки, листает скриншоты и
// подставляет актуальные версии с GitHub.
(function () {
  'use strict';

  // Удаляем service worker, оставшийся от прежнего сайта на Flutter.
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.getRegistrations().then(function (registrations) {
      registrations.forEach(function (registration) { registration.unregister(); });
    }).catch(function () {});
  }

  var root = document.documentElement;
  var strings = JSON.parse(document.getElementById('site-strings').textContent);
  var lang = root.lang;

  function storageGet(key) {
    try { return localStorage.getItem(key); } catch (e) { return null; }
  }

  function storageSet(key, value) {
    try { localStorage.setItem(key, value); } catch (e) { /* выбор не сохранится */ }
  }

  function format(template, values) {
    return template.replace(/\{(\w+)\}/g, function (match, name) {
      return name in values ? values[name] : match;
    });
  }

  // Тема. Начальное значение ставит скрипт в <head>, здесь только переключение.
  function applyThemeImages() {
    var theme = root.dataset.theme === 'light' ? 'light' : 'dark';
    document.querySelectorAll('img[data-themed]').forEach(function (img) {
      var src = img.getAttribute('src').replace(/\/images\/(dark|light)\//, '/images/' + theme + '/');
      if (src !== img.getAttribute('src')) img.setAttribute('src', src);
    });
  }

  document.querySelectorAll('.theme-toggle').forEach(function (button) {
    button.addEventListener('click', function () {
      var next = root.dataset.theme === 'light' ? 'dark' : 'light';
      root.dataset.theme = next;
      storageSet('theme', next);
      applyThemeImages();
    });
  });
  applyThemeImages();

  // Выбор языка запоминаем, но сами не перенаправляем: у каждого языка свой адрес.
  document.querySelectorAll('.lang-link').forEach(function (link) {
    link.addEventListener('click', function () {
      storageSet('language', link.getAttribute('hreflang'));
    });
  });

  // Мобильное меню.
  var sheet = document.getElementById('menu-sheet');
  document.querySelectorAll('.menu-btn').forEach(function (button) {
    button.addEventListener('click', function () { sheet.showModal(); });
  });
  if (sheet) {
    sheet.addEventListener('click', function (event) {
      if (event.target === sheet || event.target.closest('a')) sheet.close();
    });
  }

  // Вкладки приложений. Адрес вида #clip-ink открывает нужную вкладку.
  var tabs = Array.prototype.slice.call(document.querySelectorAll('.app-tab'));

  function selectTab(tab, focus) {
    tabs.forEach(function (other) {
      var selected = other === tab;
      other.setAttribute('aria-selected', selected ? 'true' : 'false');
      other.tabIndex = selected ? 0 : -1;
      document.getElementById(other.getAttribute('aria-controls')).hidden = !selected;
    });
    if (focus) tab.focus();
  }

  tabs.forEach(function (tab, index) {
    tab.addEventListener('click', function () {
      selectTab(tab, false);
      history.replaceState(null, '', '#' + tab.dataset.slug);
    });
    tab.addEventListener('keydown', function (event) {
      var step = { ArrowRight: 1, ArrowLeft: -1 }[event.key];
      if (!step) return;
      event.preventDefault();
      selectTab(tabs[(index + step + tabs.length) % tabs.length], true);
    });
  });

  function selectFromHash() {
    var slug = location.hash.slice(1);
    var tab = tabs.find(function (t) { return t.dataset.slug === slug; });
    if (!tab) return;
    selectTab(tab, false);
    document.getElementById('products').scrollIntoView();
  }
  window.addEventListener('hashchange', selectFromHash);
  selectFromHash();

  // Галереи: листание пальцем, стрелками и точками; просмотр на весь экран.
  var lightbox = document.getElementById('lightbox');
  var lightboxImage = lightbox.querySelector('img');
  lightbox.addEventListener('click', function () { lightbox.close(); });

  document.querySelectorAll('.gallery').forEach(function (gallery) {
    var track = gallery.querySelector('.gallery-track');
    var slides = gallery.querySelectorAll('.gallery-slide');
    var dots = gallery.querySelectorAll('.gallery-dots button');
    var prev = gallery.querySelector('.prev');
    var next = gallery.querySelector('.next');
    var counter = gallery.querySelector('.gallery-counter');
    var index = 0;

    function update() {
      index = Math.round(track.scrollLeft / Math.max(track.clientWidth, 1));
      dots.forEach(function (dot, i) {
        dot.setAttribute('aria-current', i === index ? 'true' : 'false');
      });
      if (prev) prev.hidden = index === 0;
      if (next) next.hidden = index >= slides.length - 1;
      if (counter && slides.length > 1) counter.textContent = (index + 1) + ' – ' + slides.length;
    }

    function goTo(i) {
      track.scrollTo({ left: i * track.clientWidth, behavior: 'smooth' });
    }

    track.addEventListener('scroll', function () { window.requestAnimationFrame(update); });
    dots.forEach(function (dot, i) { dot.addEventListener('click', function () { goTo(i); }); });
    if (prev) prev.addEventListener('click', function () { goTo(index - 1); });
    if (next) next.addEventListener('click', function () { goTo(index + 1); });
    slides.forEach(function (slide) {
      slide.addEventListener('click', function () {
        var img = slide.querySelector('img');
        lightboxImage.src = img.currentSrc || img.src;
        lightboxImage.alt = img.alt;
        lightbox.showModal();
      });
    });
    update();
  });

  // Статьи блога открываются в окне.
  document.querySelectorAll('[data-dialog]').forEach(function (button) {
    var dialog = document.getElementById(button.dataset.dialog);
    button.addEventListener('click', function () { dialog.showModal(); });
    dialog.addEventListener('click', function (event) {
      if (event.target === dialog || event.target.closest('[data-close]')) dialog.close();
    });
  });

  // Кнопка «Наверх».
  var toTop = document.querySelector('.to-top');
  window.addEventListener('scroll', function () {
    toTop.classList.toggle('visible', window.scrollY > 650);
  }, { passive: true });
  toTop.addEventListener('click', function () { window.scrollTo({ top: 0 }); });

  // Версии с GitHub. Без авторизации GitHub даёт 60 запросов в час,
  // поэтому ответ хранится в браузере 10 минут.
  var PUBLISHER = 'MiOlika';
  var INSTALLERS = ['msi', 'exe', 'msix', 'zip'];
  var CACHE_MS = 10 * 60 * 1000;
  var dateFormat = new Intl.DateTimeFormat(lang, { day: 'numeric', month: 'short', year: 'numeric' });
  var sizeFormat = new Intl.NumberFormat(lang, { minimumFractionDigits: 1, maximumFractionDigits: 1 });

  function extension(name) {
    var dot = name.lastIndexOf('.');
    return dot === -1 ? '' : name.slice(dot + 1).toLowerCase();
  }

  function parseReleases(items) {
    return items
      .filter(function (item) { return !item.draft; })
      .map(function (item) {
        var assets = (item.assets || [])
          .filter(function (a) { return INSTALLERS.indexOf(extension(a.name)) !== -1; })
          .sort(function (a, b) {
            return INSTALLERS.indexOf(extension(a.name)) - INSTALLERS.indexOf(extension(b.name));
          });
        return {
          version: (item.tag_name || '').replace(/^v\.?/i, ''),
          date: item.published_at ? new Date(item.published_at) : null,
          page: item.html_url,
          prerelease: !!item.prerelease,
          assets: assets.map(function (a) {
            return { name: a.name, ext: extension(a.name), size: a.size, url: a.browser_download_url };
          })
        };
      })
      .sort(function (a, b) { return (b.date || 0) - (a.date || 0); });
  }

  function loadReleases(repo) {
    var key = 'releases:' + repo;
    try {
      var cached = JSON.parse(localStorage.getItem(key));
      if (cached && Date.now() - cached.time < CACHE_MS) return Promise.resolve(parseReleases(cached.items));
    } catch (e) { /* без кэша */ }

    return fetch('https://api.github.com/repos/' + PUBLISHER + '/' + repo + '/releases?per_page=100', {
      headers: { Accept: 'application/vnd.github+json' }
    }).then(function (response) {
      if (!response.ok) throw new Error('GitHub ' + response.status);
      return response.json();
    }).then(function (items) {
      try { localStorage.setItem(key, JSON.stringify({ time: Date.now(), items: items })); } catch (e) { /* без кэша */ }
      return parseReleases(items);
    });
  }

  function el(tag, className, text) {
    var node = document.createElement(tag);
    if (className) node.className = className;
    if (text != null) node.textContent = text;
    return node;
  }

  function link(className, href, text, icon) {
    var a = el('a', className);
    a.href = href;
    if (icon) {
      var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
      var use = document.createElementNS('http://www.w3.org/2000/svg', 'use');
      svg.setAttribute('class', 'icon');
      svg.setAttribute('aria-hidden', 'true');
      use.setAttribute('href', '#i-' + icon);
      svg.appendChild(use);
      a.appendChild(svg);
    }
    a.appendChild(document.createTextNode(text));
    return a;
  }

  function fileSize(bytes) {
    return format(strings.fileSize, { size: sizeFormat.format(bytes / (1024 * 1024)) });
  }

  function renderReleases(container, releases, latest, allUrl) {
    var collapsed = 5;
    var showAll = false;

    function draw() {
      container.textContent = '';
      if (!releases.length) container.appendChild(el('p', null, strings.noVersions));

      (showAll ? releases : releases.slice(0, collapsed)).forEach(function (release) {
        var row = el('div', 'release' + (release === latest ? ' latest' : ''));
        var info = el('div', 'release-info');
        info.appendChild(el('span', 'release-version', format(strings.version, { version: release.version })));
        if (release === latest) info.appendChild(el('span', 'badge', strings.latestBadge));
        if (release.prerelease) info.appendChild(el('span', 'badge muted', strings.prereleaseBadge));
        if (release.date) info.appendChild(el('span', 'release-date', dateFormat.format(release.date)));

        var actions = el('div', 'release-actions');
        actions.appendChild(link('text-btn', release.page, strings.whatsNew));
        if (!release.assets.length) {
          actions.appendChild(link('btn btn-outline accent-btn', release.page, strings.openRelease, 'open_in_new'));
        }
        release.assets.forEach(function (asset) {
          var label = release.assets.length > 1
            ? asset.ext.toUpperCase() + ', ' + fileSize(asset.size)
            : format(strings.downloadWithSize, { size: fileSize(asset.size) });
          actions.appendChild(link('btn btn-outline accent-btn', asset.url, label, 'download'));
        });

        row.appendChild(info);
        row.appendChild(actions);
        container.appendChild(row);
      });

      var footer = el('div', 'versions-footer');
      if (releases.length > collapsed) {
        var toggle = el('button', 'text-btn', showAll
          ? strings.collapse
          : format(strings.showAllVersions, { count: releases.length }));
        toggle.type = 'button';
        toggle.addEventListener('click', function () { showAll = !showAll; draw(); });
        footer.appendChild(toggle);
      }
      footer.appendChild(link('text-btn', allUrl, strings.allReleasesOnGithub, 'open_in_new'));
      container.appendChild(footer);
    }

    draw();
  }

  // Ссылка на установщик для каждого репозитория, когда она уже известна.
  var downloads = {};

  // Если нажали «Скачать» раньше, чем пришёл ответ GitHub, ждём его до 4 секунд,
  // чтобы скачался установщик, а не открылась страница релиза.
  document.addEventListener('click', function (event) {
    var button = event.target.closest('[data-download]');
    if (!button || event.ctrlKey || event.metaKey || event.shiftKey) return;
    var pending = downloads[button.dataset.download];
    if (!pending || pending.url) return;
    event.preventDefault();
    var fallback = button.href;
    var timer = setTimeout(function () { location.href = fallback; }, 4000);
    pending.promise.then(function (url) {
      clearTimeout(timer);
      location.href = url || fallback;
    });
  });

  document.querySelectorAll('[data-app]').forEach(function (app) {
    var repo = app.dataset.repo;
    var versions = document.querySelector('.versions[data-repo="' + repo + '"]');
    var pending = downloads[repo] = { url: null };
    var resolveDownload;
    pending.promise = new Promise(function (resolve) { resolveDownload = resolve; });

    loadReleases(repo).then(function (releases) {
      var latest = releases.find(function (r) { return !r.prerelease; }) || releases[0];
      if (!latest) {
        pending.url = 'fallback';
        resolveDownload(null);
        if (versions) renderReleases(versions, releases, null, versions.dataset.all);
        return;
      }
      var url = latest.assets.length ? latest.assets[0].url : latest.page;
      pending.url = url;
      resolveDownload(url);

      document.querySelectorAll('[data-version="' + repo + '"]').forEach(function (node) {
        node.textContent = node.dataset.template
          ? format(node.dataset.template, { version: latest.version })
          : latest.version;
      });
      document.querySelectorAll('[data-download="' + repo + '"]').forEach(function (node) {
        node.href = url;
      });
      if (versions) renderReleases(versions, releases, latest, versions.dataset.all);
    }).catch(function () {
      // Остаются версия и ссылка на установщик, прописанные в HTML при сборке.
      pending.url = 'fallback';
      resolveDownload(null);
      if (versions) {
        versions.querySelector('.versions-loading').textContent =
          format(strings.versionsError, { version: versions.dataset.fallback });
      }
    });
  });
})();
