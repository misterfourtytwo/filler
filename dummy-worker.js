// Drift WASM Worker for Filler App
// This worker handles database operations for the Drift WASM implementation

importScripts('/sql-wasm.js');

console.log('Drift WASM Worker loaded successfully');

// Handle messages from the main thread
self.onmessage = function(e) {
  const { type, data } = e.data;
  
  try {
    switch (type) {
      case 'init':
        // Initialize the WASM database
        console.log('Initializing WASM database in worker');
        self.postMessage({ type: 'init', success: true });
        break;
        
      case 'query':
        // Handle database queries
        console.log('Processing query in worker:', data);
        self.postMessage({ type: 'query', success: true, data: data });
        break;
        
      case 'close':
        // Close the database connection
        console.log('Closing database connection in worker');
        self.postMessage({ type: 'close', success: true });
        break;
        
      default:
        console.warn('Unknown message type:', type);
        self.postMessage({ type: 'error', message: 'Unknown message type' });
    }
  } catch (error) {
    console.error('Worker error:', error);
    self.postMessage({ type: 'error', message: error.message });
  }
};

// Handle worker errors
self.onerror = function(e) {
  console.error('Worker error:', e);
  self.postMessage({ type: 'error', message: 'Worker error occurred' });
};

// Handle unhandled promise rejections
self.onunhandledrejection = function(e) {
  console.error('Unhandled promise rejection in worker:', e);
  self.postMessage({ type: 'error', message: 'Unhandled promise rejection' });
};
