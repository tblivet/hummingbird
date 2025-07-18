// Extend the global window object with ps_checkout
type PSCheckoutGlobals = typeof window & {
  ps_checkout: {
    selectors?: Record<string, string>;
    [key: string]: unknown;
  };
};

declare const window: PSCheckoutGlobals;

// Initialize ps_checkout if needed
(window as PSCheckoutGlobals).ps_checkout = (window as PSCheckoutGlobals).ps_checkout || {};

// Define selectors
(window as PSCheckoutGlobals).ps_checkout.selectors = {
  // Express Checkout
  EXPRESS_CHECKOUT_CONTAINER_PRODUCT_PAGE: '[data-ps-target="product-minimal-quantity"]',
  EXPRESS_CHECKOUT_CONTAINER_CART_PAGE: '[data-ps-target="cart-detailed-actions"]',
  EXPRESS_CHECKOUT_CONTAINER_CHECKOUT_PAGE: '[data-ps-target="step-content"]',

  // Pay Later
  PAY_LATER_OFFER_MESSAGE_CONTAINER_PRODUCT: '[data-ps-target="product-prices-block"]',
  PAY_LATER_OFFER_MESSAGE_CONTAINER_CART_SUMMARY: '[data-ps-target="cart-summary-totals"]',
  PAY_LATER_BANNER_CONTAINER: '[data-ps-target="notifications"]',

  // Payment Method Logo
  PAYMENT_METHOD_LOGO_PRODUCT_CONTAINER: '[data-ps-target="product-add-to-cart"]',
  PAYMENT_METHOD_LOGO_CART_CONTAINER: '[data-ps-target="cart-detailed-actions"]',
};
