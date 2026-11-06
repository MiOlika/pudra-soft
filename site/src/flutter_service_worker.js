// Прежний сайт на Flutter устанавливал в браузер service worker с этим именем.
// Эта версия удаляет его и его кэш, чтобы посетители сразу видели новый сайт.
self.addEventListener('install', function () { self.skipWaiting(); });
self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys()
      .then(function (keys) { return Promise.all(keys.map(function (key) { return caches.delete(key); })); })
      .then(function () { return self.registration.unregister(); })
      .then(function () { return self.clients.matchAll({ type: 'window' }); })
      .then(function (clients) { clients.forEach(function (client) { client.navigate(client.url); }); })
  );
});
