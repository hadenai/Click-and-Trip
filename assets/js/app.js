import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import Routing from '../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';
const routes = require('../../public/js/fos_js_routes.json');
Routing.setRoutingData(routes);

function App() {
  const [etapes, setEtapes] = useState([]);

  useEffect(() => {
    fetch(Routing.generate('api'))
      .then(res => res.json())
      .then(data => setEtapes(data));
  }, []);

  return (
    <div className="App">
      {
        etapes.map((etape, index) => {
          return (
            <p>étape {index}</p>
          );
        })
      }
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById('root'));
