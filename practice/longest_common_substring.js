// find the longest common substring
// abcdef, 3bcdf => bcd

// original
function lcs(s1, s2) {
  const matrix = new Array(s2.length);

  for (let i = 0; i < s2.length; i++) {
    let tmp = [];
    for (let j = 0; j < s1.length; j++) {
      if (s1[j] === s2[i]) {
        if (i >= 1 && j >= 1)
          tmp.push(1 + matrix[i - 1][j - 1]);
        else
          tmp.push(1);
      } else if (s2[i] !== s1[j]) {
        tmp.push(0);
      }
      if (j === s1.length - 1)
        matrix[i] = tmp;
    }
  }
  let max = [matrix[0][0], undefined];
  matrix.forEach((row, i) => row.forEach((num, j) => {
    if (num > max[0]) {
      max = [num, i];
    }
  }));

  let longest = s2.slice(max[1] - max[0] + 1, max[1] + 1);
  return longest;
}

// fixed array initialization
function lcs2(s1, s2) {
  let matrix = [...Array(s2.length).keys()].map(i => Array(s1.length));

  for (let i = 0; i < s2.length; i++) {
    for (let j = 0; j < s1.length; j++) {
      if (s2[i] === s1[j]) {
        if (i >= 1 && j >= 1) {
          matrix[i][j] = matrix[i - 1][j - 1] + 1;
        } else {
          matrix[i][j] = 1;
        }
      } else {
        matrix[i][j] = 0;
      }
    }
  }
  console.log(matrix);

  let max = [matrix[0][0], undefined];
  matrix.forEach((row, i) => row.forEach(num => {
    if (num > max[0]) {
      max[0] = num;
      max[1] = i;
    }
  }));

  return s2.slice(max[1] - max[0] + 1, max[1] + 1);

}

console.log(lcs("abcdef", "bcd"));