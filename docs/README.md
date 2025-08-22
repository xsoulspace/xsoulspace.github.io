# XSoulspace Web

A cinematic, bento-style showcase website for creative and ethical projects.

## Design Philosophy

**Cinematic Design Ethicist** approach - textured, grainy design system that communicates trust, creativity, and human values through storytelling interfaces.

## Tech Stack

- **Jaspr** - Dart web framework
- **Tailwind CSS** - Utility-first styling
- **Three.js** - 3D effects and particle systems (optional)

## Color Palettes

### Analog Warmth (Recommended)

```css
:root {
  --primary: #2c1810; /* Deep espresso */
  --secondary: #8b4513; /* Warm copper */
  --accent: #e6b17a; /* Creamy amber */
  --background: #f5f1eb; /* Warm paper white */
  --surface: #e8e2d8; /* Soft linen */
  --muted: #9b8b7a; /* Grain overlay */
  --contrast: #ffffff; /* Pure white */
}
```

## Project Structure

```
packages/xsoulspace_web/
├── lib/
│   ├── components/
│   │   ├── bento_grid.dart
│   │   ├── project_card.dart
│   │   ├── contributor_card.dart
│   │   └── grain_overlay.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   └── project_detail.dart
│   ├── models/
│   │   ├── project.dart
│   │   └── contributor.dart
│   └── app.dart
├── web/
│   ├── css/
│   │   ├── grain.css
│   │   └── animations.css
│   ├── js/
│   │   └── particles.js
│   └── assets/
│       ├── grain-texture.png
│       └── hero-bg.jpg
└── pubspec.yaml
```

## Implementation Phases

### Phase 1: Foundation

- [ ] Basic Jaspr setup
- [ ] Tailwind integration
- [ ] Grain texture system
- [ ] Color palette implementation

### Phase 2: Components

- [ ] Bento grid layout
- [ ] Project cards with hover effects
- [ ] Contributor profile cards
- [ ] Interactive storytelling elements

### Phase 3: Interactivity

- [ ] Smooth animations
- [ ] Particle effects (Three.js)
- [ ] Project detail modals
- [ ] Responsive interactions

### Phase 4: Content

- [ ] Project data integration
- [ ] Contributor stories
- [ ] Ethical principles section
- [ ] SEO optimization

## Design Principles

1. **Texture over Perfection** - Subtle grain, organic imperfections
2. **Story-first Hierarchy** - Every element serves narrative
3. **Ethical Transparency** - Clear, honest communication
4. **Futuristic Optimism** - Forward-thinking but warm
5. **Interactive Depth** - Layers reveal meaning
6. **Cinematic Composition** - Thoughtful framing, intentional white space
