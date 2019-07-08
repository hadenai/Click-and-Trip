import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import _ from 'underscore';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Button, Image, List, Message } from 'semantic-ui-react';

// CSS
import './Messages.css';

function Messages(props) {
  const [messages, setMessages] = useState([]);
  const [conv, setConv] = useState([]);

  if(props.userType=="client"){
    const noUserType='agency'
  } else {
    const noUserType='client'
  }

  useEffect(() => {
    getMessages();
  }, []);

  const getMessages = async () => {
    let response = await axios.get(Routing.generate('api_messages', {'user': props.userType , 'id': props.userId }));
    // let response = await axios.get('http://127.0.0.1:8000/api/messages/client/40');
    setMessages(response.data);
    // setConv(messages.map(e => e.noUserType).filter(onlyUnique));
    setConv(_.uniq(response.data.map((e) => e.agency), obj => obj.id));
  };

  function onlyUnique(value, index, self) { 
      return self.indexOf(value.id) === index;
  }

  return (
      <div className="conversation">
        <button onClick={()=> console.log({messages, conv})}></button>
        <List selection verticalAlign='middle'>
          <List.Item>
            <Image avatar src='http://icons.iconarchive.com/icons/designbolts/free-male-avatars/128/Male-Avatar-Cool-Sunglasses-icon.png' />
            <List.Content>
              <List.Header>admin</List.Header>
            </List.Content>
          </List.Item>
          { conv.map((e) => {
              return (
                <List.Item>
                  <Image avatar src='http://icons.iconarchive.com/icons/designbolts/free-male-avatars/128/Male-Avatar-Cool-Sunglasses-icon.png' />
                  <List.Content>
                    <List.Header>agency: {e.company}</List.Header>
                  </List.Content>
                </List.Item>
              );
            })
          }
        </List>
      </div>
      <div className="Messages">
        <Message>
          <Message.Header>Changes in Service</Message.Header>
          <p>
            We updated our privacy policy here to better service our customers. We recommend reviewing the
            changes.
          </p>
        </Message>
      </div>
  )
}

export default Messages;
