# Scented Studio - E-Commerce Project TODO

## Project Goal: 22 Features for 80%+ Grade
**Current Week:** Week 2 (Nov 26)  
**Current Progress:** 28% Complete! 🎉

### Current Status
- ✅ Rails 8.0.4 app initialized with PostgreSQL & Bootstrap
- ✅ Database seeded with 145 products across 8 categories
- ✅ 5 Git commits completed (need 32+ total)
- ✅ 14 features completed out of 22

---

## ✅ COMPLETED FEATURES (28% - 14 features)

### Admin & Product Management (8%)
- ✅ **1.2** ✯ Product CRUD (2%) - Models created with validations
- ✅ **1.3** Image uploads (2%) - Active Storage configured
- ✅ **1.5** Categories (2%) - Category model + associations
- ✅ **1.6** Seed script (2%) - 145 products, 8 categories

### Product Display (8%)
- ✅ **2.1** ✯ Front page navigation (2%) - Products index with hero
- ✅ **2.2** Navigate by category (2%) - Category show pages
- ✅ **2.3** ✯ Product detail pages (2%) - Full product details
- ✅ **2.5** Pagination (2%) - Kaminari gem integrated

### Design & Validation (8%)
- ✅ **4.1.4** ✯ View partials (2%) - 3 partials (product_card, navigation, flash_messages)
- ✅ **4.2.1** ✯ Model validations (2%) - All models validated
- ✅ **4.2.2** Database relationships (2%) - Many-to-many implemented
- ✅ **4.2.3** Flash messages & session (2%) - Flash partial created

### Source Control (4%)
- ✅ **5.2** ✯ Active Storage (4%) - Installed and migrated

---

## 🎯 NEXT PRIORITIES (8 features remaining for 80%)

### Immediate (Week 2-3)
1. **5.1** ✯ Git/GitHub (4%) - Need 27 more commits + 3 branches
2. **2.6** ✯ Search by category (4%) - Keyword search with category filter
3. **1.1** Admin authentication (2%) - ActiveAdmin + Devise setup

### Phase 2 (Week 4-6)
4. **3.1.1** ✯ Shopping cart (4%) - Session-based cart
5. **3.1.2** Edit cart (4%) - Quantity editing + remove items
6. **3.1.4** User accounts (8%) - Devise authentication

### Phase 3 (Week 7-10)
7. **3.1.5** Save addresses (4%) - Address model with provinces
8. **3.1.3** ✯ Checkout (8%) - Full checkout with taxes

### Polish (Week 11-15)
9. **4.1.6** CSS Framework (2%) - Bootstrap 5 full integration
10. **5.6** Deployment (6%) - Heroku or Digital Ocean

**Remaining: 52% (8 features) to reach 80%**

---

## 📊 Progress Tracking

### Completed by Category:
- **Product Management:** 4/5 features (8%)
- **Product Display:** 4/5 features (8%)
- **Design & Validation:** 4/4 features (8%)
- **Source Control:** 1/2 features (4%)
- **Shopping & Orders:** 0/6 features (0%)
- **Deployment:** 0/1 feature (0%)

### Git Progress:
- ✅ Commits: 5/32+ (15.6%)
- ❌ Branches: 0/3 (need feature branches)

---

## 🗄️ Database Schema Status

### ✅ Completed Models:
1. ✅ Product (name, description, price, stock_quantity, image)
2. ✅ Category (name, description)
3. ✅ ProductCategory (product_id, category_id) - join table
4. ✅ Active Storage tables (blobs, attachments, variant_records)

### 🔜 Pending Models:
5. [ ] AdminUser (ActiveAdmin/Devise)
6. [ ] User (Devise - email, password)
7. [ ] Province (name, gst_rate, pst_rate, hst_rate)
8. [ ] Address (user_id, street, city, province_id, postal_code)
9. [ ] Order (user_id, total_amount, status, tax_amount)
10. [ ] OrderItem (order_id, product_id, quantity, unit_price)

---

## 🚀 Immediate Next Steps

### This Week (Week 2):
1. ✅ Create models with validations
2. ✅ Seed database with 145 products
3. ✅ Build front-end views
4. ✅ Implement pagination
5. [ ] Add search functionality (Feature 2.6)
6. [ ] Set up ActiveAdmin (Feature 1.1)
7. [ ] Create feature branches for Git (Feature 5.1)

### Next Week (Week 3):
1. [ ] Implement shopping cart in session
2. [ ] Add cart editing functionality
3. [ ] Set up Devise for user authentication
4. [ ] Create Province model with tax rates

---

## 📅 Milestone Targets

- **Week 11:** 15%+ ✅ (Currently at 28%)
- **Week 12:** 30%+ 🎯 (Need 2% more)
- **Week 13:** 45%+ ⚠️ (Need 17% more)
- **Week 14:** 60%+ ⚠️ (Need 32% more)
- **Week 15:** 80%+ ⚠️ (Need 52% more)

**Status:** Ahead of schedule! 🚀

---

## 📝 Notes

- Server running at http://localhost:3000
- Bootstrap 4 pagination theme installed
- All views using partials for DRY code
- Flash messages integrated throughout
- Responsive design with Bootstrap 5
- Product images ready for Active Storage uploads
