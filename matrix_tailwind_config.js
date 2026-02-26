/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./src/**/*.{js,jsx,ts,tsx}"],
    theme: {
        extend: {
            colors: {
                'manifesto-dark': '#000000',
                'manifesto-green': '#00ff41',
                'manifesto-panel': '#0a0a0a',
            },
            fontFamily: {
                mono: ['Courier New', 'monospace'],
            }
        }
    },
    plugins: [],
};
