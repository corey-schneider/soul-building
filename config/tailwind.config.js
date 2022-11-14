const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  prefix: 'tw-',
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        heading: ['Plus Jakarta Sans'],
        opensans: ['Open Sans']
      },
    },
  },
  corePlugins: {
    preflight: true,
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
