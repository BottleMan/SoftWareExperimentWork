function stop(){
  return false;
}
document.oncontextmenu = stop;
window.history.forward(1);
