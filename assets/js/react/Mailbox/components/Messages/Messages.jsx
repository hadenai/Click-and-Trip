import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import _ from 'underscore';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Form, Image, List, Message } from 'semantic-ui-react';

// CSS
import './Messages.css';

function Messages(props) {
  const [allMessages, setAllMessages] = useState([]);
  const [convs, setConvs] = useState([]);
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');
  const [target, setTarget] = useState('admin');

  useEffect(() => {
    getAllMessages();
  }, []);

  useEffect(() => {
    viewDown();
  });

  const viewDown = () => {
    document.getElementById('divbottom').scrollIntoView({ behavior: "smooth" });
  };

  const getAllMessages = async () => {
    let response = await axios.get(Routing.generate('api_messages', { 'user': props.userType, 'id': props.userId }));
    setAllMessages(response.data.sort(function (a, b) {
      return new Date(a.sendAt).getTime() - new Date(b.sendAt).getTime();
    }));
    setConvs(_.uniq(response.data.map((e) => props.userType === 'client' ? e.agency : e.client), obj => obj.id));
    if (target == 'admin') {
      setMessages(response.data.filter(el => el.admin));
    } else if (props.userType === 'client') {
      setMessages(response.data.filter(el => el.agency.id == target.id && !el.admin));
    } else if (props.userType === 'agency') {
      setMessages(response.data.filter(el => el.client.id == target.id && !el.admin));
    }
  };

  const handleConv = (e) => {
    if (e == 'admin') {
      setMessages(allMessages.filter(el => el.admin));
      setTarget(e);
    } else if (props.userType === 'client') {
      setMessages(allMessages.filter(el => el.agency.id == e.id && !el.admin));
      setTarget(e);
    } else if (props.userType === 'agency') {
      setMessages(allMessages.filter(el => el.client.id == e.id && !el.admin));
      setTarget(e);
    }
    document.getElementsByClassName('selected')[0].classList.remove('selected');
    document.getElementById(`conv-${e.id}`).classList.add('selected');
    viewDown();
    // document.getElementById(`conv-${people}`).click();
  };

  const handleSubmit = () => {
    let info = {};
    if (props.userType == 'client') {
      info.from = { id: messages[0].client.id, type: 'client' };
      info.to = { id: messages[0].agency.id, type: 'agency' };
    } else {
      info.from = { id: messages[0].agency.id, type: 'agency' };
      info.to = { id: messages[0].client.id, type: 'client' };
    }
    info.content = input;
    info.adminBool = messages[0].admin;
    info.idHistory = messages[0].histories.id;

    axios.post(Routing.generate('profil_send_message'), info)
      .then(() => {
        getAllMessages();
        setInput('');
      })
      .then(() => {
        if (props.userType === 'client') {
          setMessages(allMessages.filter(e => e.agency.id === messages[0].agency.id && !e.admin));
        } else if (props.userType === 'agency') {
          setMessages(allMessages.filter(e => e.client.id === messages[0].client.id && !e.admin));
        } else {
          setMessages(allMessages.filter(e => e.admin));
        }
      });
  };

  return (
    <Fragment>
      <div className="Conversations">
        <List selection verticalAlign="middle">
          {
            props.userType !== 'admin' &&
            <List.Item id="conv-0" className="selected" onClick={() => handleConv('admin')}>
              <Image avatar src="../images/small-logo.png" />
              <List.Content>
                <List.Header>admin</List.Header>
              </List.Content>
            </List.Item>
          }
          {
            convs.map((e, i) => {
              return (
                <List.Item key={i} id={`conv-${e.id}`} onClick={() => handleConv(e)}>
                  <Image avatar src={e.picture} />
                  <List.Content>
                    <List.Header>{props.userType === 'client' ? 'agence' : 'client'}: {props.userType === 'client' ? e.company : e.surname}</List.Header>
                  </List.Content>
                </List.Item>
              );
            })
          }
        </List>
      </div>
      <div className="Messages">
        <div className="list-messages">
          {messages.map((e, i) => {
            return (
              <Message key={i} className={props.userType === e.sender ? 'i right' : 'i left'}>
                {e.content}
              </Message>
            )
          })}
          <div id="divbottom"></div>  
        </div>
        <div className="write-send">
          <Form onSubmit={() => { input !== '' && handleSubmit() }}>
            <Form.Group>
              <Form.Input placeholder="Ecrire un message" value={input} onChange={(event) => setInput(event.target.value)} />
              <Form.Button content=">" />
            </Form.Group>
          </Form>
        </div>
      </div>
    </Fragment>
  )
}

export default Messages;
