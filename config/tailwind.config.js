const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        'snow-storm': {
          100: '#eceff4',
          200: '#e5e9f0',
          300: '#d8dee9',
        },
        'polar-night':{
          100: '#4c566a',
          200: '#434c5e',
          300: '#3b4252',
          400: '#2e3440',
        },
        'frost':{
          100: '#5e81ac',
          200: '#81a1c1',
          300: '#88c0d0',
          400: '#8fbcbb',
        },
        'aurora':{
          100: '#b48ead',
          200: '#a3be8c',
          300: '#ebcb8b',
          400: '#d08770',
          500: '#bf616a',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
