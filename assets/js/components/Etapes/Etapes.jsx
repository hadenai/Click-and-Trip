import React, { useState, useEffect, Fragment } from 'react';
import Routing from '../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Card } from 'semantic-ui-react';

// CSS
import './Etapes.css';

function Etapes() {
  const [etapes, setEtapes] = useState([]);
  const [mesEtapes, setMesEtapes] = useState([]);

  useEffect(() => {
    fetch(Routing.generate('api'))
      .then(res => res.json())
      .then(data => setEtapes(data))
      .then(() => console.log('data fetched.'));
  }, []);

  const addEtape = index => setMesEtapes([...mesEtapes, etapes.splice(index, 1)[0]]);

  const removeEtape = index => setEtapes([...etapes, mesEtapes.splice(index, 1)[0]]);

  return (
    <Fragment>
      <div className="Etapes">
        <Card.Group centered>
          {
            etapes.map((etape, index) => {
              return (
                <Card key={index} onClick={() => addEtape(index)}>
                  <Card.Content>
                    <Card.Header>{etape.destination}</Card.Header>
                    <Card.Meta>{etape.duration} jours</Card.Meta>
                    <Card.Description>{etape.nameStage}</Card.Description>
                  </Card.Content>
                </Card>
              );
            })
          }
        </Card.Group>
      </div>
      <div className="ListEtapes">
        <Card.Group centered>
          {
            mesEtapes.map((etape, index) => {
              return (
                <Card key={index} fluid onClick={() => removeEtape(index)}>
                  <Card.Content>
                    <Card.Header>{etape.destination}</Card.Header>
                    <Card.Meta>{etape.duration} jours</Card.Meta>
                    <Card.Description>{etape.nameStage}</Card.Description>
                  </Card.Content>
                </Card>
              );
            })
          }
        </Card.Group>
      </div>
    </Fragment>
  )
}

export default Etapes;