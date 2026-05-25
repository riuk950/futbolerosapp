---
name: Sogamoso Athletic System
colors:
  surface: '#f9f9fc'
  surface-dim: '#dadadc'
  surface-bright: '#f9f9fc'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f3f3f6'
  surface-container: '#eeeef0'
  surface-container-high: '#e8e8ea'
  surface-container-highest: '#e2e2e5'
  on-surface: '#1a1c1e'
  on-surface-variant: '#444653'
  inverse-surface: '#2f3133'
  inverse-on-surface: '#f0f0f3'
  outline: '#747685'
  outline-variant: '#c4c5d5'
  surface-tint: '#3056c4'
  primary: '#002576'
  on-primary: '#ffffff'
  primary-container: '#0038a8'
  on-primary-container: '#96adff'
  inverse-primary: '#b6c4ff'
  secondary: '#506600'
  on-secondary: '#ffffff'
  secondary-container: '#c1f100'
  on-secondary-container: '#546b00'
  tertiary: '#705d00'
  on-tertiary: '#ffffff'
  tertiary-container: '#c8a900'
  on-tertiary-container: '#4b3e00'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dce1ff'
  primary-fixed-dim: '#b6c4ff'
  on-primary-fixed: '#00164f'
  on-primary-fixed-variant: '#093cab'
  secondary-fixed: '#c3f400'
  secondary-fixed-dim: '#abd600'
  on-secondary-fixed: '#161e00'
  on-secondary-fixed-variant: '#3c4d00'
  tertiary-fixed: '#ffe16d'
  tertiary-fixed-dim: '#e9c400'
  on-tertiary-fixed: '#221b00'
  on-tertiary-fixed-variant: '#544600'
  background: '#f9f9fc'
  on-background: '#1a1c1e'
  surface-variant: '#e2e2e5'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 48px
    fontWeight: '800'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
  title-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-caps:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: '700'
    lineHeight: 16px
    letterSpacing: 0.05em
  stat-value:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '800'
    lineHeight: 32px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 16px
  margin-mobile: 16px
  margin-desktop: 48px
---

## Brand & Style

The design system is engineered for the high-energy environment of sports tournament management in Sogamoso. It balances professional administrative rigor with the vibrant community spirit of local athletics. The visual language is **Corporate Modern with an Athletic Edge**, prioritizing clarity, momentum, and reliability.

The target audience ranges from tournament organizers managing complex brackets to athletes checking scores on the sidelines. The UI must evoke a sense of "match day" excitement while maintaining the structured feel of a premium sports broadcast. High-contrast elements and robust layouts ensure the interface remains functional under bright outdoor sunlight or in the fast-paced environment of a sports complex.

## Colors

The palette is anchored by **Sogamoso Blue**, a deep, authoritative navy that establishes trust and institutional stability. This is contrasted by **Action Green**, a high-visibility neon-adjacent hue used exclusively for primary interactions and "live" indicators. **Champion Gold** is reserved for achievement states, trophies, and first-place standings.

The neutral palette utilizes a cool-grey scale to maintain the "tech" feel of the app, ensuring that the vibrant accent colors remain impactful without causing visual fatigue. Backgrounds utilize a subtle off-white to reduce glare during outdoor use.

## Typography

This design system utilizes **Inter** for its versatile, athletic character. Headings use heavy weights (Bold/ExtraBold) with tight letter-spacing to mimic sports apparel branding and scoreboard aesthetics. 

For technical data—such as jersey numbers, match times, and coordinates—**JetBrains Mono** is used as a supporting label font to provide a "data-driven" precision feel. Body text maintains generous line heights to ensure readability for users who are on the move.

## Layout & Spacing

The layout follows a **Fluid Grid** model with a focus on mobile-first utility.
- **Mobile:** 4-column grid with 16px margins. Content is primarily stacked in cards.
- **Tablet:** 8-column grid with 24px margins. Introduction of side-panels for tournament brackets.
- **Desktop:** 12-column grid with a max-width of 1280px. 

Spacing follows a 4px baseline shift, but primarily moves in increments of 8px (8, 16, 24, 32) to maintain a rhythmic, structured feel. Large padding is used within cards to keep data dense but digestible.

## Elevation & Depth

Visual hierarchy is achieved through **Tonal Layers** supplemented by **Ambient Shadows**. 
- **Level 0 (Background):** The base canvas, slightly off-white or very light grey.
- **Level 1 (Cards):** White surfaces with a soft, 12% opacity shadow (Y: 4px, Blur: 12px) tinted with Sogamoso Blue to ground the elements.
- **Level 2 (Modals/Overlays):** Higher elevation with a 20% opacity shadow and a 1px subtle stroke to define edges.

Depth is used to signify interactable containers. Information is "carved" into the layout using subtle inset borders for input fields, while actionable items sit "on top" of the surface.

## Shapes

The design system employs a **Rounded** shape language to feel modern and accessible. A standard radius of **12px (0.75rem)** is applied to all primary containers and cards, striking a balance between "friendly" and "technical." 

Buttons and input fields follow this 12px rule to maintain consistency across the interface. Smaller UI elements like tags and chips may use a fully rounded (pill) shape to distinguish them from structural card elements.

## Components

### Buttons
Primary buttons use **Action Green** with black text for maximum contrast. They feature a slight "squish" animation on press. Secondary buttons use a Sogamoso Blue outline.

### Cards
Tournament cards are the primary vessel for information. They must include a clear header (Event Name) and a footer for "Quick Actions" (e.g., View Standings).

### Scoreboard Components
Specialized components for live scores use a dark background (Neutral 900) with high-contrast white or Action Green numerals to mimic physical electronic scoreboards.

### Input Fields
Large, accessible touch targets (minimum 48px height) with 12px rounded corners. Active states are indicated by a 2px Sogamoso Blue border.

### Chips & Badges
Used for "Live," "Final," or "Postponed" statuses. "Live" status badges should incorporate a small pulsating dot icon.

### Brackets
A custom component for tournament progression, using thick 2px lines and rounded nodes to represent team pairings, ensuring paths are clear even on small screens.