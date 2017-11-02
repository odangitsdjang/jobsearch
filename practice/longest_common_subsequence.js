function longest_common_subsequence(str1, str2) {
  let matrix = [...Array(str1.length).keys()].map(i => Array(str2.length));
  for (let i = 0; i < str1.length; i++) {
    for (let j = 0; j < str2.length; j++) {

      if (str1[i] === str2[j]) {
        if (i === 0 && j !== 0) {
          matrix[i][j] = matrix[i][j - 1] + str1[i];
        } else if (i !== 0 && j === 0) {
          matrix[i][j] = matrix[i - 1][j] + str1[i];
        } else if (i === 0 && j === 0) {
          matrix[i][j] = str1[i];
        } else {
          matrix[i][j] = matrix[i - 1][j - 1] + str1[i];
        }

      } else {
        // look at above and previous in matrix and get the longest
        if (j >= 1 && i >= 1) {
          matrix[i][j] = getBiggest(matrix[i - 1][j], matrix[i][j - 1]);
        } else if (i === 0 && j !== 0) {
          matrix[i][j] = getBiggest(matrix[i][j - 1]);
        } else if (i !== 0 && j === 0) {
          matrix[i][j] = getBiggest(matrix[i - 1][j]);
        } else {
          matrix[i][j] = "";
        }
      }
    }
  }
  return matrix[str1.length - 1][str2.length - 1];
}

function getBiggest(...arr) {
  let biggest = "";
  arr.forEach(val => {
    if (val.length > biggest.length)
      biggest = val;
  });

  return biggest;
}

longest_common_subsequence("RZGADBAC", "ABDEBC"); 
// output should be ADBC