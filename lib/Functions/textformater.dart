textformater(str, n) {
  if (str.length > n) {
    return str.toString().substring(0, n - 1);
  } else {
    return str;
  }
}

