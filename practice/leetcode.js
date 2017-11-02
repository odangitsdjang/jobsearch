// You are given two non - empty linked lists representing two non - negative integers.The digits are stored in reverse order and each of their nodes contain a single digit.Add the two numbers and
// return it as a linked list.

// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

// Input: (2 - > 4 - > 3) + (5 - > 6 - > 4)
// Output: 7 - > 0 - > 8  = array

var addTwoNumbers = function (l1, l2) {
  let current1 = l1;
  let current2 = l2;
  let ansLL = [];
  let carry = 0;

  while (current1 && current2) {
    let sum = current1.val + current2.val + carry;
    sum >= 10 ? carry = 1 : carry = 0;
    sum %= 10;
    current1 = current1.next;
    current2 = current2.next;
    ansLL.push(sum);
  }
  while (current1) {
    let sum = current1.val + carry;
    sum >= 10 ? carry = 1 : carry = 0;
    sum %= 10;
    current1 = current1.next;
    ansLL.push(sum);
  }

  while (current2) {
    let sum = current2.val + carry;
    sum >= 10 ? carry = 1 : carry = 0;
    sum %= 10;
    current2 = current2.next;
    ansLL.push(sum);

  }
  carry == 1 ? ansLL.push(1) : null;

  return ansLL;
};

