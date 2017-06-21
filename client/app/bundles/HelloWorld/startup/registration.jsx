import ReactOnRails from 'react-on-rails';

import HelloWorld from '../components/HelloWorld';
import FilterBar from '../components/FilterBar';
var EventCard = require('../components/EventCard');


// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld,
  FilterBar,
  EventCard,
});