import yaml from '@rollup/plugin-yaml';
 
export default {
  input: 'index.js',
  output: {
    dir: 'dist',
    format: 'es'
  },
  plugins: [yaml()]
};
