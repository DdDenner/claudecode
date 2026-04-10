/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Design tokens from Story 2.2
        primary: {
          50: '#f5f5f5',
          100: '#e6e6e6',
          500: '#808080',
          600: '#1a1a1a',
          700: '#0a0a0a',
          900: '#000000',
        },
        accent: {
          50: '#cce5ff',
          100: '#99ccff',
          500: '#0066cc',
          600: '#0052a3',
          700: '#003d7a',
        },
        secondary: {
          50: '#f8fafc',
          500: '#808080',
          700: '#1a1a1a',
          900: '#0a0a0a',
        },
      },
      fontFamily: {
        // Será definido por Uma
        sans: ['var(--font-sans)', 'system-ui', 'sans-serif'],
        display: ['var(--font-display)', 'system-ui', 'sans-serif'],
      },
      spacing: {
        '128': '32rem',
        '144': '36rem',
      },
      animation: {
        fadeIn: 'fadeIn 0.5s ease-in-out',
        slideUp: 'slideUp 0.6s ease-out',
        pulse: 'pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': {
            opacity: '0',
            transform: 'translateY(10px)',
          },
          '100%': {
            opacity: '1',
            transform: 'translateY(0)',
          },
        },
      },
      boxShadow: {
        card: '0 4px 6px rgba(0, 0, 0, 0.1)',
        hover: '0 20px 25px rgba(0, 0, 0, 0.15)',
      },
    },
  },
  plugins: [],
};
