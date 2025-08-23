// Dummy worker file for Drift WASM
// This file exists to satisfy the API requirement but is not actually used
// The database operations will run in the main thread instead

console.log('Dummy worker loaded (not actually used)');

// Export a minimal worker interface to prevent errors
self.onmessage = function(e) {
  console.warn('Dummy worker received message but is not functional:', e.data);
  self.postMessage({ type: 'error', message: 'Dummy worker not functional' });
};

self.onerror = function(e) {
  console.error('Dummy worker error:', e);
};
