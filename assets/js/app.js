import React from 'react';
import ReactDOM from 'react-dom';

// ROUTING
import Routing from '../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';
const routes = require('../../public/js/fos_js_routes.json');
Routing.setRoutingData(routes);

// COMPONENTS
import Etapes from './components/Etapes/Etapes';

// CSS
import 'semantic-ui-css/semantic.min.css';
import './app.css'

function App() {
  return (
    <div className="App">
      <Etapes />
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById('root'));
