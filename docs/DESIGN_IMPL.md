**Plan for xsoulspace Website Redesign (Cinematic Bento Layout)**

**1. Read & Analyze (Current State & Reference)**

- Review `docs/DESIGN_GUIDELINES.md` and `docs/UI_KIT.md` for tokens, philosophy, and atomic structure.
- Study the provided dark-background layout: note the grid, spacing, text scale, and grouping.
- Examine the two bento reference images for:
  - Visual hierarchy (headline, subhead, card, label, etc.)
  - Spacing, padding, and margin
  - Font sizes, weights, and contrast
  - Card/bento block shapes, border radii, and shadow/subtle separation
  - Iconography and micro-interactions

**2. Define Layout Structure**

- **Header:**
  - xsoulspace logo/title, tagline, and navigation (if any)
- **Legend/Key:**
  - Small, left-aligned legend for bento categories (as in the sketch)
- **Main Bento Grid:**
  - Responsive, multi-row grid with clear vertical rhythm and intentional whitespace
  - Each bento group (Apps, Games, Libraries, etc.) is a visually distinct section with a header, icon, and description
  - Each project is a bento card: title, subtitle, icon, and optional accent
- **Ethics & Values Section:**
  - Dedicated bento group for values, with larger text and more breathing room
- **Personal Thoughts:**
  - Footer or bottom section, styled as a handwritten note or “creator’s corner”

**3. UI Kit Audit & Refactor**

- Audit existing UI kit components for:
  - Card/bento block: ensure proper padding, border radius, and shadow
  - Typography: create/adjust tokens for headline, subhead, body, label, etc.
  - Iconography: ensure consistent sizing and alignment
  - Group header: new molecule for section headers with icon, title, subtitle, and count
- Refactor or create new components as needed, following atomic design

**4. Data Integration**

- Use `ProjectsService` to load project data.
- Map projects into their respective bento groups (Apps, Games, Libraries, etc.) based on metadata.
- Pass data to bento group and card components.

**5. Responsive & Accessibility**

- Ensure grid adapts from 1 to 5 columns based on screen size.
- Use semantic HTML for accessibility (section, header, nav, main, etc.).
- Ensure color contrast and font sizes meet accessibility standards.

**6. Aesthetic Detailing**

- Maintain xsoulspace’s current color palette and grainy/cinematic texture overlays.
- Use subtle paper backgrounds, color-coded left borders, and soft drop shadows for bento groups.
- Typography:
  - Headline: large, bold, but not overwhelming
  - Subhead: medium, lighter weight
  - Card text: compact, clear, with enough spacing
- Micro-interactions:
  - Hover/focus states for cards
  - Animated transitions for grid rearrangement

**7. Documentation & Guidelines**

- Update `DESIGN_GUIDELINES.md` with new layout rules, spacing, and typography tokens.
- Update `UI_KIT.md` with new/updated components, usage, and atomic structure.

---

**Implementation Steps**

1. **Read and Audit**

   - Read both design docs.
   - List all current UI kit components and identify gaps.

2. **Design Tokens**

   - Define/adjust spacing, color, and typography tokens for bento layout.

3. **Component Refactor**

   - Refactor/create:
     - `BentoCard` (atom)
     - `BentoGroupHeader` (molecule)
     - `BentoGrid` (organism)
     - `Legend` (molecule)
     - `EthicsValuesSection` (organism)
   - Ensure all components are documented in `UI_KIT.md`.

4. **Layout Implementation**

   - Build the main page layout using new/refactored components.
   - Integrate data from `ProjectsService`.

5. **Aesthetic Polish**

   - Apply xsoulspace color theme, textures, and micro-interactions.
   - Test on multiple screen sizes.

6. **Documentation**
   - Update both design docs with new rules and components.

---

**Tips for Bento Aesthetics (from references):**

- Use generous padding and whitespace.
- Group related items with clear visual boundaries.
- Use color and iconography for quick scanning, not decoration.
- Keep text concise, with clear hierarchy.
- Avoid visual clutter—every element must have a purpose.
