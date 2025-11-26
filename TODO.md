# Scented Studio - E-Commerce Project TODO

## Project Goal: 22 Features for 80%+ Grade
**Current Week:** Week 2 (Nov 26)  
**Timeline:** 13 weeks until Week 15

### Current Status
- ✅ Rails 8.0.4 app initialized with PostgreSQL & Bootstrap
- ✅ 1.2 - Product CRUD (2%) - Marked as complete
- 🎯 Target: 6 Starred Features + 16 Regular Features = 22 Total

---

## 🌟 PRIORITY: 6 Starred Features (Must Complete First)

### Selected Starred Features (18% total)
1. ✅ **1.2** ✯ Product CRUD (2%) - COMPLETED
2. ⏳ **2.1** ✯ Front page navigation (2%)
3. ⏳ **2.3** ✯ Product detail pages (2%)
4. ⏳ **4.1.4** ✯ View partials (2%)
5. ⏳ **4.2.1** ✯ Model validations (2%)
6. ⏳ **5.1** ✯ Git/GitHub (4%) - 32+ commits, 3+ branches
7. ⏳ **5.2** ✯ Active Storage (4%)

**Note:** Implementing only 6 starred features initially (excluding 1.1, 2.6, 3.1.1, 3.1.3)

---

## 📋 Phase 1: Foundation (Week 2-4) - Target: 20%

### Step 1: Database Setup & Models
- [ ] **1.5** Create Category model (2%)
- [ ] **4.2.2** Set up database relationships (2%)
  - Product model with validations
  - Category model with validations
  - Many-to-many relationship (ProductCategory join table)

### Step 2: Admin & Product Management
- [ ] **1.3** Image uploads with Active Storage (2%)
- [ ] **1.6** Seed database (2%)
  - 100+ products across 4+ categories
  - Use Faker for realistic data

### Step 3: Front-End Display
- [ ] **2.1** ✯ Front page with product listings (2%)
- [ ] **2.2** Navigate by category (2%)
- [ ] **2.3** ✯ Product detail pages (2%)
- [ ] **2.5** Pagination with Kaminari (2%)

### Step 4: Design Patterns
- [ ] **4.1.4** ✯ View partials (2%)
- [ ] **4.2.1** ✯ Model validations (2%)
- [ ] **4.2.3** Flash messages & session (2%)

**Phase 1 Total: 20% (10 features)**

---

## 📋 Phase 2: Shopping & Orders (Week 5-8) - Target: 28%

### Shopping Cart
- [ ] **3.1.1** Shopping cart in session (4%)
- [ ] **3.1.2** Edit cart quantity & remove items (4%)

### User Accounts & Checkout
- [ ] **3.1.4** User accounts with Devise (8%)
- [ ] **3.1.5** Save addresses with provinces (4%)
- [ ] **3.1.3** Checkout process with taxes (8%)

**Phase 2 Total: 28% (5 features)**

---

## 📋 Phase 3: Polish & Advanced (Week 9-15) - Target: 32%

### Design & Framework
- [ ] **4.1.6** CSS Framework integration (2%)
- [ ] **4.1.5** SCSS with nesting, variables (2%)
- [ ] **4.1.2** Consistent design (4%)

### Orders & Admin
- [ ] **3.2.1** Order history (4%)
- [ ] **1.1** Admin authentication (2%)

### Deployment & Testing
- [ ] **5.1** ✯ Git/GitHub - 32+ commits, 3+ branches (4%)
- [ ] **5.2** ✯ Active Storage (4%)
- [ ] **5.6** Deploy to Heroku/Digital Ocean (6%)
- [ ] **5.4** Rubocop (4%)

**Phase 3 Total: 32% (9 features)**

---

## 📊 Feature Summary (22 Total = 80%)

### By Points:
- **2% features:** 12 features = 24%
- **4% features:** 8 features = 32%
- **6% features:** 1 feature = 6%
- **8% features:** 2 features = 16%

### By Priority:
- ✯ **Starred (6):** 18%
- **Regular (16):** 62%
- **Total:** 80%

---

## 🗄️ Database Schema

### Models to Create:
1. ✅ Product (name, description, price, stock_quantity, timestamps)
2. [ ] Category (name, description, timestamps)
3. [ ] ProductCategory (product_id, category_id) - join table
4. [ ] User (devise fields)
5. [ ] Province (name, gst_rate, pst_rate, hst_rate)
6. [ ] Address (user_id, street, city, province_id, postal_code)
7. [ ] Order (user_id, total_amount, status, tax_amount, timestamps)
8. [ ] OrderItem (order_id, product_id, quantity, unit_price)
9. [ ] AdminUser (ActiveAdmin - optional for later)

---

## 🚀 Immediate Next Steps

1. ✅ Initialize Rails app with PostgreSQL
2. [ ] Set up Git repository and initial commit
3. [ ] Create database and run migrations
4. [ ] Generate Product model with validations
5. [ ] Generate Category model with validations
6. [ ] Set up many-to-many relationship
7. [ ] Install Active Storage
8. [ ] Create seed data (100+ products, 4+ categories)
9. [ ] Build front-end views with Bootstrap
10. [ ] Implement product listing and detail pages

---

## 📅 Milestones
- **Week 11:** 15%+ ⚠️
- **Week 12:** 30%+ ⚠️
- **Week 13:** 45%+ ⚠️
- **Week 14:** 60%+ ⚠️
- **Week 15:** 80%+ ⚠️
