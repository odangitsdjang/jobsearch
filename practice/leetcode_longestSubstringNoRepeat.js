// Given a string, find the length of the longest substring without repeating characters.
// Examples:
// Given "abcabcbb", the answer is "abc", which the length is 3.
// Given "bbbbb", the answer is "b", with the length of 1.
// Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

function lengthOfLongestSubstring(s) {
  let temp = '';
  let count = 0;
  let max = 0;
  for (let i = 0; i < s.length; i++) {

    let cha = s[i];
    if (temp.indexOf(cha) == -1) { temp += cha; count++; if (count > max) { max = count; } }
    else {
      let chaIndex = temp.indexOf(cha);
      temp = temp.slice(chaIndex + 1, temp.length) + cha;

      count = temp.length;
    }
  }
  return max;
}

console.log(lengthOfLongestSubstring("dvdf"));