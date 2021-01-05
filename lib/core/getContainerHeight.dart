double getContainerHeight(int snapshotDataLenght) {
  switch (snapshotDataLenght) {
    case 1:
      return 60.0;
      break;
    case 2:
      return 120.0;
      break;
    case 3:
      return 180.0;
      break;
    case 4:
      return 240.0;
      break;
    case 5:
      return 360.0;
      break;
    case 6:
      return 420.0;
      break;
    case 7:
      return 480.0;
      break;
    default:
      return 60;
  }
}
