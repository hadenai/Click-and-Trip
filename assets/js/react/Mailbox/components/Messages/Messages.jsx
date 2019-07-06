import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Button, Image, List } from 'semantic-ui-react';

// CSS
import './Messages.css';

function Messages(props) {
  const [messages, setMessages] = useState([]);
  const [Conv, setConv] = useState([]);

  if(props.userType=='client'){
    const noUserType='agency'
  } else {
    const noUserType='client'
  }

  useEffect(() => {
    getMessages();
  }, []);

  const getMessages = async () => {
    let response = await axios.get(Routing.generate('api_messages', {'user': props.userType , 'id': props.userId }));
    setMessages(response.data);
    setConv(messages.map(e => e.noUserType).filter(onlyUnique));
  };

  function onlyUnique(value, index, self) { 
      return self.indexOf(value.id) === index;
  }

  return (
      <div className="conversation">
        <List selection verticalAlign='middle'>
          { Conv.map((e) => {
              return (
                <List.Item>
                  <Image avatar src='http://icons.iconarchive.com/icons/designbolts/free-male-avatars/128/Male-Avatar-Cool-Sunglasses-icon.png' />
                  <List.Content>
                    <List.Header>{e.id}: {e.company}</List.Header>
                  </List.Content>
                </List.Item>
              );
            })
          }
        </List>
      </div>
      // <div className="Messages"></div>
  )
}

export default Messages;
