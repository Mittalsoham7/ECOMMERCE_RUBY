# Scented Studio - Implementation Roadmap

## Current Status: 26% (13 features completed)

## Target: 60% (22 features total)

---

## Phase 1: Search Functionality (Week 2)
**Target: +4% = 30%**

### Feature 2.6 ✯ Search by category (4%)
- [ ] Add search form to products index
- [ ] Add search form to navigation
- [ ] Implement keyword search in ProductsController
- [ ] Add category dropdown filter
- [ ] Search in product name and description
- [ ] Display search results with highlighting
- [ ] Show "no results" message when appropriate
- [ ] Test search functionality

---

## Phase 2: Product Filtering (Week 2-3)
**Target: +2% = 32%**

### Feature 2.4 Filter products (2%)
- [ ] Add "on_sale" boolean to products table
- [ ] Add "new" scope (products created in last 3 days)
- [ ] Add "recently_updated" scope
- [ ] Add filter buttons to products index
- [ ] Implement filtering in controller
- [ ] Style filter UI
- [ ] Test all filters

---

## Phase 3: Shopping Cart (Week 3-4)
**Target: +8% = 40%**

### Feature 3.1.1 Shopping cart (4%)
- [ ] Create CartController
- [ ] Implement session-based cart storage
- [ ] Add "Add to Cart" buttons on product cards
- [ ] Add "Add to Cart" button on product show page
- [ ] Create cart show page
- [ ] Display cart items with product details
- [ ] Show cart total
- [ ] Add cart icon to navigation with item count
- [ ] Test cart functionality

### Feature 3.1.2 Edit cart (4%)
- [ ] Add quantity input fields in cart
- [ ] Implement quantity update action
- [ ] Add "Remove" button for each item
- [ ] Implement remove action
- [ ] Update cart total dynamically
- [ ] Add "Clear Cart" button
- [ ] Show empty cart message
- [ ] Test cart editing

---

## Phase 4: User Authentication (Week 4-5)
**Target: +8% = 48%**

### Feature 3.1.4 User accounts (8%)
- [ ] Install Devise gem
- [ ] Generate User model with Devise
- [ ] Add name field to users
- [ ] Configure Devise views
- [ ] Style sign up page
- [ ] Style sign in page
- [ ] Add user menu to navigation
- [ ] Implement sign out
- [ ] Add "My Account" page
- [ ] Test authentication flow

---

## Phase 5: Address Management (Week 5-6)
**Target: +4% = 52%**

### Feature 3.1.5 Save addresses (4%)
- [ ] Create Province model with tax rates
- [ ] Seed all Canadian provinces/territories
- [ ] Create Address model
- [ ] Associate addresses with users
- [ ] Create address form
- [ ] Add province dropdown
- [ ] Implement address CRUD
- [ ] Set default address
- [ ] Test address management

---

## Phase 6: Checkout Process (Week 6-8)
**Target: +8% = 60%**

### Feature 3.1.3 Checkout (8%)
- [ ] Create Order model
- [ ] Create OrderItem model
- [ ] Create CheckoutController
- [ ] Build checkout flow (multi-step or single page)
- [ ] Display cart summary
- [ ] Show/edit shipping address
- [ ] Calculate taxes based on province
- [ ] Display tax breakdown (GST/PST/HST)
- [ ] Create order on submission
- [ ] Save order items with prices at time of purchase
- [ ] Clear cart after order
- [ ] Show order confirmation page
- [ ] Send order confirmation email (optional)
- [ ] Test full checkout flow

---

## Phase 7: Styling & Polish (Week 8-9)
**Target: +4% = 64%**

### Feature 4.1.5 SCSS with nesting/variables (2%)
- [ ] Convert application.bootstrap.scss to use variables
- [ ] Define color variables
- [ ] Define spacing variables
- [ ] Use nesting for component styles
- [ ] Use inheritance (@extend)
- [ ] Use operators for calculations
- [ ] Document SCSS structure

### Feature 4.1.6 CSS Framework integration (2%)
- [ ] Ensure all pages use Bootstrap grid
- [ ] Use Bootstrap components (cards, buttons, forms)
- [ ] Implement Bootstrap navigation
- [ ] Use Bootstrap utilities
- [ ] Ensure responsive design
- [ ] Test on mobile/tablet/desktop

---

## Testing Checklist

### Search (2.6)
- [ ] Search by keyword works
- [ ] Search by category works
- [ ] Combined search works
- [ ] Empty search handled
- [ ] No results message shown

### Filters (2.4)
- [ ] "On Sale" filter works
- [ ] "New" filter works (last 3 days)
- [ ] "Recently Updated" filter works
- [ ] Filters can be combined
- [ ] Filter UI is clear

### Shopping Cart (3.1.1, 3.1.2)
- [ ] Add to cart works
- [ ] Cart displays correctly
- [ ] Quantity can be updated
- [ ] Items can be removed
- [ ] Cart total calculates correctly
- [ ] Cart persists in session
- [ ] Empty cart handled

### User Accounts (3.1.4)
- [ ] Sign up works
- [ ] Sign in works
- [ ] Sign out works
- [ ] Password validation works
- [ ] Email validation works
- [ ] User menu displays correctly

### Addresses (3.1.5)
- [ ] Address can be created
- [ ] Address can be edited
- [ ] Address can be deleted
- [ ] Province dropdown works
- [ ] Default address can be set
- [ ] Validation works

### Checkout (3.1.3)
- [ ] Checkout flow works
- [ ] Address selection works
- [ ] Tax calculation correct for each province
- [ ] Order created correctly
- [ ] Order items saved with correct prices
- [ ] Cart cleared after order
- [ ] Confirmation page shows

### Styling (4.1.5, 4.1.6)
- [ ] SCSS variables used
- [ ] SCSS nesting used
- [ ] Bootstrap grid used throughout
- [ ] Bootstrap components used
- [ ] Responsive on all devices
- [ ] Consistent design

---

## Git Strategy

### Branches to Create:
1. `feature/search-and-filters` - For 2.6 and 2.4
2. `feature/shopping-cart` - For 3.1.1 and 3.1.2
3. `feature/user-auth-checkout` - For 3.1.4, 3.1.5, 3.1.3

### Commit Strategy:
- Commit after each sub-feature
- Descriptive commit messages
- Regular commits (aim for 3-5 per feature)
- Merge branches back to main when complete

---

## Timeline

- **Week 2:** Search + Filters (6%)
- **Week 3-4:** Shopping Cart (8%)
- **Week 4-5:** User Auth (8%)
- **Week 5-6:** Addresses (4%)
- **Week 6-8:** Checkout (8%)
- **Week 8-9:** Styling (4%)

**Total: 38% additional features**
**Final: 64% (26% current + 38% new)**

---

## Notes

- Focus on core functionality first
- Test each feature before moving to next
- Keep code DRY and follow Rails conventions
- Document any issues or decisions
- Regular git commits throughout
