/** @type {import('tailwindcss').Config} */
// eslint-disable-next-line no-undef
module.exports = {
  content: ['./src/**/*.{js,jsx,ts,tsx}', './public/*.html'],
  darkMode: 'media',
  theme: {
    extend: {
      boxShadow: {
        'inner': 'inset 0 3px 5px 0 rgba(0, 0, 0, 0.1)',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}