'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "6568349175ac6916ca1ebd52412e4457",
"index.html": "102adbb700cba5055fd02cda2561681a",
"/": "102adbb700cba5055fd02cda2561681a",
"CNAME": "beb3b4a41727647af5e7b96c3d282197",
"main.dart.js": "6f2436d9e650bfee89532d641da26803",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"app-ads.txt": "1acc4cac3813bca8436cb16e1af5095e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "87777148714d52f343709d1b6c55420d",
"assets/AssetManifest.json": "4e79184ad711779b1501af64b5a28d63",
"assets/NOTICES": "c2d3d4705f6f09814ed6f4b306b4d957",
"assets/FontManifest.json": "aecbb6ff7ae13818c4f9ff3ad1cc870c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "92c0d4ef5348716d30d5ce43852533dd",
"assets/shaders/ink_sparkle.frag": "92666cc97576adbea2e2d3061a953137",
"assets/AssetManifest.bin": "28fcaa8929c21a0cb42e9db05ab875d8",
"assets/fonts/MaterialIcons-Regular.otf": "8442725ea88a6142701db3dc671e17b7",
"assets/assets/json/projects.json": "b394567ef9eb5e81b8f5bbd755005537",
"assets/assets/icons/twitter_logo_black.svg": "7ea02ead698ec08221e2f79eb7be05af",
"assets/assets/icons/discord_logo_white.svg": "145dc557845548a36a82337912ca3ac5",
"assets/assets/icons/icon_last_answer.png": "5a342ca65fab57eafa439e65962650d3",
"assets/assets/icons/github/GitHub-Mark-Light-32px.png": "d56df49a807a9fd06eb1667a84d3810e",
"assets/assets/icons/github/GitHub-Mark-120px-plus.png": "ef7a02b69836dc8b6a732a54c4200dcb",
"assets/assets/icons/github/GitHub-Mark-32px.png": "f87561b8bb354ef83b09a66e54f70e08",
"assets/assets/icons/github/GitHub-Mark-64px.png": "438c17272c5f0e9f4a6da34d3e4bc5bd",
"assets/assets/icons/github/GitHub-Mark-Light-120px-plus.png": "472739dfb5857b1f659f4c4c6b4568d0",
"assets/assets/icons/github/GitHub-Mark-Light-64px.png": "eb94bb97c3410733ce017b184d314723",
"assets/assets/icons/discord_logo_black.svg": "2d20a45d79110dc5bf947137e9d99b66",
"assets/assets/icons/twitter_logo_white.svg": "fb08dd7a2ba24fe54c0d2078375a5467",
"assets/assets/icons/icon_word_by_word_game.png": "e58e79776834344d9be6f5b6cbe2d7af",
"assets/assets/badges/apple_store.svg": "2928664fe1fc6aca88583a6f606d60ba",
"assets/assets/badges/snapstore.svg": "98b159eda2dbbe57599ed8501b712be3",
"assets/assets/badges/google_play.png": "db9b21a1c41f3dcd9731e1e7acfdbb57",
"assets/google_fonts/NotoSans-Regular.ttf": "5a87cce84010f7cea085ae218d44a64b",
"assets/google_fonts/NotoColorEmoji.ttf": "b0b162dbe8fe80adae4f553c67f812dc",
"canvaskit/canvaskit.js": "971260b2fcb9a1c3b5fd69fb698cf9ba",
"canvaskit/canvaskit.wasm": "0a83aedb52818bc044b1f3f35724b27c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
