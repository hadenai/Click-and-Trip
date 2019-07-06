import React from 'react';
import ReactDOM from 'react-dom';

// ROUTING
import Routing from '../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';
const routes = require('../../../../public/js/fos_js_routes.json');
Routing.setRoutingData(routes);

// COMPONENTS
import Steps from './components/Steps/Steps';

// CSS
import 'semantic-ui-css/semantic.min.css';
import './Mailbox.css'

function Mailbox() {
  return (
    <div className="Mailbox">
      <Steps />
    </div>
  );
}

ReactDOM.render(<Mailbox />, document.getElementById('root'));
