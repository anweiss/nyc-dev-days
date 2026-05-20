// ===== FLASH SALE PAGE =====
// Time-limited promotion with countdown timer, discounted pricing,
// automatic promo-code application on Add to Cart, and a graceful
// "Sale Ended" state when the timer reaches zero.
//
// Depends on PROMO-007 (Promotions Engine) in production; this demo
// hard-codes a single FLASH40 promo (40% off) for illustration.

const FLASH_PROMO_CODE = "FLASH40";
const FLASH_DISCOUNT = 0.40; // 40% off the original price
const FLASH_DURATION_MS = 24 * 60 * 60 * 1000; // 24h
const FLASH_END_STORAGE_KEY = "techmart_flash_sale_end";

// Curated subset of products that participate in the flash sale.
// Each entry references a product id from PRODUCTS (see app.js).
const FLASH_SALE_PRODUCT_IDS = [1, 3, 5, 9, 11, 12];

function getFlashSaleEnd() {
  let end = parseInt(localStorage.getItem(FLASH_END_STORAGE_KEY), 10);
  if (!end || isNaN(end) || end < Date.now() - FLASH_DURATION_MS) {
    end = Date.now() + FLASH_DURATION_MS;
    try { localStorage.setItem(FLASH_END_STORAGE_KEY, String(end)); } catch (e) { /* storage disabled */ }
  }
  return end;
}

function flashSalePrice(originalPrice) {
  return Math.round(originalPrice * (1 - FLASH_DISCOUNT));
}

function renderFlashProducts() {
  const grid = document.getElementById("flashProductsGrid");
  if (!grid) return;

  const items = FLASH_SALE_PRODUCT_IDS
    .map(id => PRODUCTS.find(p => p.id === id))
    .filter(Boolean);

  grid.innerHTML = items.map(p => {
    const original = p.original || p.price;
    const sale = flashSalePrice(original);
    const pct = Math.round(FLASH_DISCOUNT * 100);
    return `
      <div class="product-card flash-product-card" data-category="${p.category}">
        <div class="product-img-placeholder">${p.emoji}</div>
        <div class="product-info">
          <span class="product-badge badge-sale">-${pct}%</span>
          <div class="product-name">${p.name}</div>
          <div class="product-category">${p.category}</div>
          <div class="product-footer">
            <div class="product-price">$${sale}<span class="original">$${original}</span></div>
            <button class="add-to-cart" onclick="addFlashSaleToCart(${p.id})">Add to Cart</button>
          </div>
        </div>
      </div>`;
  }).join("");
}

function addFlashSaleToCart(productId) {
  const product = PRODUCTS.find(p => p.id === productId);
  if (!product) return;

  // Reuse the cart from app.js, but apply the flash-sale price + promo code.
  const original = product.original || product.price;
  const salePrice = flashSalePrice(original);
  const existing = cart.find(i => i.id === productId);
  if (existing) {
    existing.qty++;
  } else {
    cart.push({ ...product, price: salePrice, promoCode: FLASH_PROMO_CODE, qty: 1 });
  }
  updateCartCount();
  showToast(`${product.emoji} ${product.name} added — promo ${FLASH_PROMO_CODE} applied (-${Math.round(FLASH_DISCOUNT * 100)}%)`);
}

function pad2(n) { return String(n).padStart(2, "0"); }

function renderCountdown(remainingMs) {
  const totalSeconds = Math.max(0, Math.floor(remainingMs / 1000));
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;
  const h = document.getElementById("cdHours");
  const m = document.getElementById("cdMinutes");
  const s = document.getElementById("cdSeconds");
  if (h) h.textContent = pad2(hours);
  if (m) m.textContent = pad2(minutes);
  if (s) s.textContent = pad2(seconds);
}

function showSaleEnded() {
  const countdown = document.getElementById("countdown");
  const ended = document.getElementById("saleEnded");
  const productsSection = document.getElementById("flash-products-section");
  if (countdown) countdown.hidden = true;
  if (ended) ended.hidden = false;
  if (productsSection) productsSection.classList.add("sale-ended-state");
  // Disable Add-to-Cart buttons in the products grid.
  document.querySelectorAll("#flashProductsGrid .add-to-cart").forEach(btn => {
    btn.disabled = true;
    btn.textContent = "Sale Ended";
    btn.onclick = null;
  });
}

let flashTimerId = null;
function startFlashSaleTimer() {
  const endTime = getFlashSaleEnd();

  function tick() {
    const remaining = endTime - Date.now();
    if (remaining <= 0) {
      renderCountdown(0);
      showSaleEnded();
      if (flashTimerId) { clearInterval(flashTimerId); flashTimerId = null; }
      return;
    }
    renderCountdown(remaining);
  }

  tick();
  flashTimerId = setInterval(tick, 1000);
}

// ===== INIT (only on the flash sale page) =====
if (document.getElementById("flashProductsGrid")) {
  renderFlashProducts();
  startFlashSaleTimer();
}
