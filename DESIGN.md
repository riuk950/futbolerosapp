---
name: Kinetic Minimalist
colors:
  surface: '#f9f9f9'
  surface-dim: '#dadada'
  surface-bright: '#f9f9f9'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f3f3f3'
  surface-container: '#eeeeee'
  surface-container-high: '#e8e8e8'
  surface-container-highest: '#e2e2e2'
  on-surface: '#1a1c1c'
  on-surface-variant: '#40493d'
  inverse-surface: '#2f3131'
  inverse-on-surface: '#f1f1f1'
  outline: '#707a6c'
  outline-variant: '#bfcab9'
  surface-tint: '#106d20'
  primary: '#0b6b1d'
  on-primary: '#ffffff'
  primary-container: '#2e8534'
  on-primary-container: '#f7fff1'
  inverse-primary: '#82db7e'
  secondary: '#2a6b2c'
  on-secondary: '#ffffff'
  secondary-container: '#acf4a4'
  on-secondary-container: '#307231'
  tertiary: '#9d365f'
  on-tertiary: '#ffffff'
  tertiary-container: '#bc4f77'
  on-tertiary-container: '#fffbff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#9df898'
  primary-fixed-dim: '#82db7e'
  on-primary-fixed: '#002204'
  on-primary-fixed-variant: '#005312'
  secondary-fixed: '#acf4a4'
  secondary-fixed-dim: '#91d78a'
  on-secondary-fixed: '#002203'
  on-secondary-fixed-variant: '#0c5216'
  tertiary-fixed: '#ffd9e2'
  tertiary-fixed-dim: '#ffb1c8'
  on-tertiary-fixed: '#3e001d'
  on-tertiary-fixed-variant: '#822049'
  background: '#f9f9f9'
  on-background: '#1a1c1c'
  surface-variant: '#e2e2e2'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: 0em
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0em
  label-caps:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '700'
    lineHeight: 16px
    letterSpacing: 0.05em
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0em
  headline-md-mobile:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 26px
    letterSpacing: -0.01em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  container-margin: 16px
  gutter: 12px
---

## Brand & Style
The design system focuses on a high-performance, athletic aesthetic that prioritizes data clarity and ease of navigation. It employs a **Minimalist** approach with a sport-centric edge, moving away from heavy ornamentation to focus on content. The emotional response is one of professional reliability, energy, and precision. By utilizing expansive whitespace and a vibrant primary green, the interface feels fresh and focused, suitable for a modern sports management and statistics platform.

## Colors
The palette is anchored by a vibrant **Pitch Green** (#388E3C), used strategically for primary actions, active states, and brand accents. The background architecture is purely neutral, utilizing **Optic White** for primary cards and content areas, and **Cool Gray** (#F5F5F5) for page-level backgrounds to create subtle contrast. This approach replaces deep-colored containers with a high-clarity light mode that ensures maximum readability for complex sports data.

## Typography
This design system utilizes **Inter** exclusively to maintain a systematic and utilitarian feel. To achieve a modern, athletic look, tracking (letter spacing) is tightened on headlines for a more "compact" and aggressive appearance. Conversely, body copy uses standard spacing for legibility. A clear hierarchy is established by using uppercase labels for section headers and metadata, mirroring the style of sports scoreboards and professional broadcasts.

## Layout & Spacing
The layout follows a **fluid grid** model with a focus on generous internal padding to create "breathable" data sets. 
- **Mobile:** A 4-column grid with 16px side margins. 
- **Desktop:** A 12-column grid with a maximum content width of 1280px.
Spacing is strictly based on a 4px baseline grid. Dividers are used sparingly and should be 1px thick in a light gray (#E0E0E0) to separate match events or list items without cluttering the visual field.

## Elevation & Depth
In line with the minimalist objective, this design system avoids heavy shadows. Depth is communicated via **Tonal Layers** and **Low-Contrast Outlines**. 
- **Level 0 (Background):** Neutral Gray (#F5F5F5).
- **Level 1 (Cards/Containers):** White (#FFFFFF) with a 1px solid border (#E0E0E0).
- **Level 2 (Interactive/Floating):** White (#FFFFFF) with a very soft, highly diffused 8% black shadow (0px 4px 12px) to indicate clickability or temporary overlays.

## Shapes
The shape language is refined and consistent. A standard radius of **8px (0.5rem)** is applied to cards, input fields, and primary buttons. This provides a soft, approachable feel while maintaining the structural integrity of a professional tool. Tags and status indicators (like "Live" or "Final") may use a pill-shaped radius (full round) to distinguish them from structural UI components.

## Components
- **Buttons:** Primary buttons are solid Pitch Green with white text. Secondary buttons are outlined with a 1px border. All buttons use 8px rounding.
- **Cards:** Cards are flat white with a subtle 1px border. Use generous padding (16px–24px) and remove any inner drop shadows.
- **Match Rows:** Use thin 1px dividers between rows. Team logos should be centered in 32px or 40px containers.
- **Input Fields:** Use a light gray background (#F5F5F5) or a white background with a 1px border. Focus states must use the primary green for the border stroke.
- **Navigation:** The top bar should be clean white or primary green with high-contrast icons. Bottom navigation (for mobile) uses a white surface with the primary green reserved only for the active icon state.
- **Chips/Status:** Use the primary green for "Live" or active states, and a neutral gray for "Scheduled" or inactive states.