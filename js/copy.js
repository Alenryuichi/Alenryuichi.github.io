document.addEventListener('DOMContentLoaded', function () {
  const btns = document.querySelectorAll('.copy-code-btn');
  btns.forEach(function (btn) {
    btn.addEventListener('click', function () {
      const code = this.parentNode.querySelector('code');
      const textArea = document.createElement('textarea');
      textArea.value = code.innerText;
      document.body.appendChild(textArea);
      textArea.select();
      document.execCommand('copy');
      document.body.removeChild(textArea);
      this.innerText = 'Copied!';
      setTimeout(() => {
        this.innerText = 'Copy';
      }, 2000);
    });
  });
});

new ClipboardJS('.copy-text-btn');