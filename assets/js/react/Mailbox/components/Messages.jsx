import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import _ from 'underscore';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Button, Image, List } from 'semantic-ui-react';

// CSS
import './Messages.css';

function Messages(props) {
  const [messages, setMessages] = useState([]);
  const [Conv, setConv] = useState([]);

  useEffect(() => {
    getMessages();
  }, []);

  const getMessages = async () => {
    let response = await axios.get(Routing.generate('api_messages', {'user': props.userType , 'id': props.userId }));
    setMessages(response.data);
    setConv(messages.filter(onlyUnique));
  };

  function onlyUnique(value, index, self) { 
      return self.indexOf(value) === index;
  }

  return (
      <div className="conversation">
        <List selection verticalAlign='middle'>

          <List.Item>
            <Image avatar src='/images/avatar/small/helen.jpg' />
            <List.Content>
              <List.Header>Helen</List.Header>
            </List.Content>
          </List.Item>
        </List>
      </div>
      <div className="Messages">
        {
          myMessages.length > 0
          && <Button className="validateButton" color="green" fluid onClick={validateTrip}>Valider mon voyage</Button>
        }
        <Card.Group centered>
          {
            myMessages.map((step, index) => {
              return (
                <Card key={index} fluid color="red" onClick={() => removeStep(index)}>
                  <Card.Content>
                    <Card.Header>{step.destination}</Card.Header>
                    <Card.Meta>{step.duration} jours</Card.Meta>
                    <Card.Description>{step.nameStage}</Card.Description>
                  </Card.Content>
                </Card>
              );
            })
          }
        </Card.Group>
      </div>
  )
}

export default Messages;
