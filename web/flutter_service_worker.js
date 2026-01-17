'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b443c9668b4b9f61e5f6ad8b4123fdb2",
"assets/AssetManifest.bin.json": "5dc41753f88fb2d416956815277fcc53",
"assets/AssetManifest.json": "f4bc39231aea735564a7dedf7f2d0b5b",
"assets/assets/fonts/Cormorant-Regular.ttf": "18aa6739eaeced699d441fae8c8956d6",
"assets/assets/fonts/CormorantRegular.ttf": "18aa6739eaeced699d441fae8c8956d6",
"assets/assets/fonts/MaterialIcons-Regular.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/assets/fonts/Nexa-Bold.otf": "c9f309b3d47969ecac64a77a6c672594",
"assets/assets/fonts/Nexa-Light.otf": "12108809f49c49bcdc126dcecc938761",
"assets/assets/fonts/Product-Sans-Regular.ttf": "eae9c18cee82a8a1a52e654911f8fe83",
"assets/assets/fonts/Quicksand-Regular.otf": "3ce1580b66db6742cecd4b41519fb5f1",
"assets/assets/images/programmer-3.gif": "5083e0a2a7dcaae07c142e8b87036a27",
"assets/assets/images/programmer-4.gif": "c0d1b11e54c2b07f7353dd160e8ba80d",
"assets/assets/images/programmer-5.gif": "4b1c9f7f37c34211e56123b4e93757a2",
"assets/assets/images/programmer-6.gif": "e65836b23ff1cb0091ef9c4ac605cf80",
"assets/FontManifest.json": "fd414842df31dc10c90b483b662e564c",
"assets/fonts/Cormorant-Regular.ttf": "18aa6739eaeced699d441fae8c8956d6",
"assets/fonts/CormorantRegular.ttf": "18aa6739eaeced699d441fae8c8956d6",
"assets/fonts/MaterialIcons-Regular.otf": "4da3c330b7d062dbe5ee8efa9bf09139",
"assets/fonts/MaterialIcons-Regular.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/fonts/Nexa-Bold.otf": "c9f309b3d47969ecac64a77a6c672594",
"assets/fonts/Nexa-Light.otf": "12108809f49c49bcdc126dcecc938761",
"assets/fonts/Product-Sans-Regular.ttf": "eae9c18cee82a8a1a52e654911f8fe83",
"assets/fonts/Quicksand-Regular.otf": "3ce1580b66db6742cecd4b41519fb5f1",
"assets/icons/ic_dribbble.png": "ab2d08e303c4d0ee5467e4c272fdfd8b",
"assets/icons/ic_evernote.png": "19de46a5b8348420d099e78fde665955",
"assets/icons/ic_github.png": "43ce87609eb221d09d4832a9c0e709d0",
"assets/icons/ic_google.png": "8d61a1ae36dbd9d82305eab43cdb07fa",
"assets/icons/ic_linkedIn.png": "5b5479e865a403692971bdf905e09998",
"assets/icons/ic_twitter.png": "83651994320dc0d3c7ad896ad058bb53",
"assets/images/programmer-3.gif": "5083e0a2a7dcaae07c142e8b87036a27",
"assets/images/programmer-4.gif": "c0d1b11e54c2b07f7353dd160e8ba80d",
"assets/images/programmer-5.gif": "4b1c9f7f37c34211e56123b4e93757a2",
"assets/images/programmer-6.gif": "e65836b23ff1cb0091ef9c4ac605cf80",
"assets/NOTICES": "6fc8498603db364ef380915b67ac02bd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/highlight.png": "2aecc31aaa39ad43c978f209962a985c",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/squiggly.png": "68960bf4e16479abb83841e54e1ae6f4",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/strikethrough.png": "72e2d23b4cdd8a9e5e9cadadf0f05a3f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/underline.png": "59886133294dd6587b0beeac054b2ca3",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/highlight.png": "2fbda47037f7c99871891ca5e57e030b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/squiggly.png": "9894ce549037670d25d2c786036b810b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/strikethrough.png": "26f6729eee851adb4b598e3470e73983",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/underline.png": "a98ff6a28215341f764f96d627a5d0f5",
"assets/shaders/ink_sparkle.frag": "9bb2aaa0f9a9213b623947fa682efa76",
"assets/shaders/stretch_effect.frag": "a70217f9ceba606e287441a0df5be64d",
"canvaskit/canvaskit.js": "4d1e85fa7485c3b2f38877206ad60089",
"canvaskit/canvaskit.js.symbols": "cd60996d998c96148c6b3245aa4f79be",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "5986f8281d3ff5aa43516ec637c2352b",
"canvaskit/chromium/canvaskit.js.symbols": "abce3e84295438db81e9753c30fe3c2b",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "d16458b3d26fe6c8c52bf62df5e5a52f",
"canvaskit/skwasm.js.symbols": "148546317b68494b4e09dcab02f87135",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "d684311c36a7a439e12bebd0b63a9bea",
"canvaskit/skwasm_heavy.js.symbols": "218aadf9004b320bc6cf0d0bb04ed157",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "d5f724fc6dc7ac1b2193bc9ec78d0e4e",
"flutter.js": "1c7e59be1cc906f8d37361ad32ed7e52",
"flutter_bootstrap.js": "ac957a54837c7752145c30d28b75a643",
"icons/Icon-192.png": "7d3d1f290035ee3a78a60c55c22c38eb",
"icons/Icon-512.png": "0f7f1a791b36af0d84ad052241a13213",
"icons/Icon-maskable-192.png": "7d3d1f290035ee3a78a60c55c22c38eb",
"icons/Icon-maskable-512.png": "0f7f1a791b36af0d84ad052241a13213",
"index.html": "30f012f9371a5098997778ca3b9c0dd9",
"/": "30f012f9371a5098997778ca3b9c0dd9",
"main.dart.js": "2a34962102ebb7ff222b7749486c1833",
"manifest.json": "0a47bca440559d122128df612710e386",
"version.json": "b3ab034d5ea5ed69269256c539004906"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
