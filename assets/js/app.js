import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import Routing from '../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';
const routes = require('../../public/js/fos_js_routes.json');
Routing.setRoutingData(routes);

<<<<<<< HEAD
function App() {
  const [etapes, setEtapes] = useState([]);
=======
// any CSS you require will output into a single css file (app.css in this case)
require('../scss/app.scss');
require('semantic-ui/dist/semantic.min.css')
require('semantic-ui/dist/semantic.min.js')
require('../scss/_footer.scss')
require('../scss/_navbar.scss')
require('./_navbar.js')
>>>>>>> backup

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
