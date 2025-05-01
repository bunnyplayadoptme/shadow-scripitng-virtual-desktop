function openApp(id) {
  const win = document.getElementById(id);
  win.style.display = 'block';
  win.style.zIndex = Date.now();
}

function closeWindow(id) {
  document.getElementById(id).style.display = 'none';
}

function installApp(name) {
  let icon = document.createElement('div');
  icon.className = 'icon';

  if (name === 'Chrome') {
    icon.innerText = '🌐 Chrome';
    icon.onclick = () => launchWindow('https://google.com', 'Chrome');
  }

  if (name === 'Roblox Executor') {
    icon.innerText = '💻 Executor';
    icon.onclick = () => openApp('RobloxExecutor');
  }

  icon.style.top = Math.random() * 300 + 'px';
  icon.style.left = Math.random() * 400 + 'px';

  document.getElementById('desktop').appendChild(icon);
}

function launchWindow(url, title = 'Browser') {
  window.open(url, '_blank', 'width=800,height=600');
}

function executeLua() {
  const code = document.getElementById('luaCode').value;
  const output = document.getElementById('output');
  output.innerText = `Simulating execution of:\n\n${code}`;
}
