String setRoverImage(String rover) {
  print(rover);
  switch (rover) {
    case 'Spirit':
      return 'lib/images/spirit&opportunity.jpeg';
    case 'Opportunity':
      return 'lib/images/spirit&opportunity.jpeg';
    case 'Perseverance':
      return 'lib/images/perseverance.jpeg';
    case 'Curiosity':
      return 'lib/images/curiosity.jpeg';
    default:
      return 'lib/images/mars_With_rover.jpeg';
  }
}
