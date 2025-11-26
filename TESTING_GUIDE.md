# 🧪 SCENTED STUDIO - TESTING GUIDE

## Quick Start Testing

### Prerequisites
1. Ensure Rails server is running:
   ```bash
   cd /Users/sohammittal/Desktop/RUBY\ PROJECT/scented-studio
   bin/rails server
   ```

2. Open browser to: http://localhost:3000

---

## 🛒 Test 1: Shopping Cart (Features 3.1.1 & 3.1.2)

### Add to Cart:
1. ✅ Browse products on homepage
2. ✅ Click "Add to Cart" on any product
3. ✅ Verify cart badge shows "1" in navigation
4. ✅ Add another product
5. ✅ Verify cart badge updates to "2"

### View Cart:
1. ✅ Click cart icon in navigation
2. ✅ Verify all products are listed
3. ✅ Verify quantities and prices are correct
4. ✅ Verify subtotal calculates correctly

### Edit Cart:
1. ✅ Click "+" button to increase quantity
2. ✅ Verify subtotal updates
3. ✅ Click "-" button to decrease quantity
4. ✅ Verify subtotal updates
5. ✅ Click "Remove" on an item
6. ✅ Verify item is removed
7. ✅ Click "Clear Cart"
8. ✅ Verify cart is empty

**Expected Result:** ✅ Cart functionality works perfectly

---

## 👤 Test 2: User Accounts (Feature 3.1.4)

### Sign Up:
1. ✅ Click "Sign Up" in navigation
2. ✅ Fill in:
   - Name: "Test User"
   - Email: "test@example.com"
   - Password: "password123"
   - Password Confirmation: "password123"
3. ✅ Click "Sign up"
4. ✅ Verify redirect to homepage
5. ✅ Verify user dropdown shows "Test User"

### Sign Out:
1. ✅ Click user dropdown
2. ✅ Click "Sign Out"
3. ✅ Verify redirect to homepage
4. ✅ Verify "Sign In" and "Sign Up" buttons appear

### Sign In:
1. ✅ Click "Sign In"
2. ✅ Enter email and password
3. ✅ Click "Log in"
4. ✅ Verify successful login

**Expected Result:** ✅ User authentication works securely

---

## 📦 Test 3: Checkout Process (Features 3.1.3 & 3.1.5)

### Prerequisites:
- Must be signed in
- Must have items in cart

### Checkout Flow:
1. ✅ Add 2-3 products to cart
2. ✅ Click "Proceed to Checkout" in cart
3. ✅ Verify checkout page displays:
   - Order summary on right
   - All cart items listed
   - Subtotal shown
   - Shipping form on left

### Enter Address (Feature 3.1.5):
1. ✅ Fill in address:
   - Street Address: "123 Main Street"
   - City: "Winnipeg"
   - Province: Select "Manitoba"
   - Postal Code: "R3C 0A1"
2. ✅ Click "Place Order"

### Order Confirmation:
1. ✅ Verify redirect to order confirmation page
2. ✅ Verify page shows:
   - Success message
   - Order number
   - Order date
   - All items ordered
   - Subtotal
   - Tax amount (Manitoba: GST 5% + PST 7% = 12%)
   - Total amount
   - Shipping address
3. ✅ Verify cart is now empty (check cart icon)

**Expected Result:** ✅ Complete checkout with tax calculation

---

## 📋 Test 4: Order History (Feature 3.2.1)

### View Orders:
1. ✅ Click user dropdown
2. ✅ Click "My Orders"
3. ✅ Verify orders list page shows:
   - All past orders
   - Order numbers
   - Order dates
   - Order status
   - Total amounts
   - Item previews

### View Order Details:
1. ✅ Click "View Details" on any order
2. ✅ Verify order details page shows:
   - Order number
   - Order date and time
   - Order status badge
   - Shipping address
   - All order items with:
     - Product names
     - Quantities
     - Unit prices
     - Subtotals
   - Subtotal
   - Tax amount
   - Total amount

**Expected Result:** ✅ Order history displays correctly

---

## 🎨 Test 5: SCSS Styling (Feature 4.1.5)

### Visual Checks:
1. ✅ Verify consistent color scheme (brown/earth tones)
2. ✅ Hover over product cards - verify smooth lift animation
3. ✅ Hover over buttons - verify color darkening and shadow
4. ✅ Check rounded corners on cards and buttons
5. ✅ Verify form inputs have styled focus states
6. ✅ Check navigation hover effects

### Responsive Design:
1. ✅ Resize browser window to mobile size
2. ✅ Verify navigation collapses to hamburger menu
3. ✅ Verify product grid adjusts to single column
4. ✅ Verify cart and checkout pages are mobile-friendly

**Expected Result:** ✅ Professional, consistent styling throughout

---

## 🧪 Test 6: Tax Calculation (Feature 3.1.3)

### Test Different Provinces:

**Test 1 - Ontario (HST):**
1. ✅ Add products to cart (subtotal: $100)
2. ✅ Checkout with Ontario address
3. ✅ Verify tax: $13.00 (13% HST)
4. ✅ Verify total: $113.00

**Test 2 - Alberta (GST only):**
1. ✅ Add products to cart (subtotal: $100)
2. ✅ Checkout with Alberta address
3. ✅ Verify tax: $5.00 (5% GST)
4. ✅ Verify total: $105.00

**Test 3 - British Columbia (GST + PST):**
1. ✅ Add products to cart (subtotal: $100)
2. ✅ Checkout with BC address
3. ✅ Verify tax: $12.00 (5% GST + 7% PST)
4. ✅ Verify total: $112.00

**Expected Result:** ✅ Correct tax rates for all provinces

---

## 🔄 Test 7: Complete User Journey

### Full E-Commerce Flow:
1. ✅ Visit homepage
2. ✅ Browse products by category
3. ✅ Search for products
4. ✅ View product details
5. ✅ Add multiple products to cart
6. ✅ Edit cart quantities
7. ✅ Sign up for account
8. ✅ Proceed to checkout
9. ✅ Enter shipping address
10. ✅ Place order
11. ✅ View order confirmation
12. ✅ Check order history
13. ✅ Sign out
14. ✅ Sign back in
15. ✅ Verify orders are still there

**Expected Result:** ✅ Seamless end-to-end experience

---

## ✅ TESTING CHECKLIST SUMMARY

- [ ] Shopping Cart - Add items
- [ ] Shopping Cart - Update quantities
- [ ] Shopping Cart - Remove items
- [ ] User Sign Up
- [ ] User Sign In
- [ ] User Sign Out
- [ ] Checkout - Enter address
- [ ] Checkout - Province selection
- [ ] Checkout - Place order
- [ ] Order Confirmation
- [ ] Order History - List
- [ ] Order History - Details
- [ ] Tax Calculation - Multiple provinces
- [ ] SCSS Styling - Visual consistency
- [ ] SCSS Styling - Hover effects
- [ ] Responsive Design - Mobile view

---

## 🐛 Common Issues & Solutions

### Issue: Cart badge not updating
**Solution:** Refresh the page or check browser console for errors

### Issue: Can't sign up
**Solution:** Ensure password is at least 6 characters

### Issue: Checkout redirects to sign in
**Solution:** This is expected - you must be signed in to checkout

### Issue: Tax not calculating
**Solution:** Ensure province is selected in address form

### Issue: Styles not loading
**Solution:** Restart Rails server and clear browser cache

---

## 📊 Test Results Template

```
Date: _______________
Tester: _______________

Feature 3.1.1 - Shopping Cart:        [ ] PASS  [ ] FAIL
Feature 3.1.2 - Edit Cart:            [ ] PASS  [ ] FAIL
Feature 3.1.3 - Checkout:             [ ] PASS  [ ] FAIL
Feature 3.1.4 - User Accounts:        [ ] PASS  [ ] FAIL
Feature 3.1.5 - Save Addresses:       [ ] PASS  [ ] FAIL
Feature 3.2.1 - Order History:        [ ] PASS  [ ] FAIL
Feature 4.1.5 - SCSS Styling:         [ ] PASS  [ ] FAIL

Overall Status: [ ] ALL TESTS PASSED  [ ] ISSUES FOUND

Notes:
_________________________________________________
_________________________________________________
_________________________________________________
```

---

## 🎯 Ready for Instructor Demo

All features are implemented and ready for demonstration. Follow this testing guide during your marking session to showcase all functionality.

**Estimated Demo Time:** 15-20 minutes for all 7 features
