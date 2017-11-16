// Given a bunch of coins and the target value/change,
// how many different combinations are there to make that change?

// change(4,[1,2,3]) => 4 because [1,1,1,1],[1,1,2], [2,2], [1,3]
// note that [1,1,2] and [1,2,1] are counted as the same

// approach it with dynamic programming! The below hasnt been tested but seems to be working

function changeCombination(target, coins) {
  let helper = Array(target + 1);

  let sorted_coins = coins.sort((a, b) => a - b);
  helper.fill(0);
  helper[0] = 1;

  sorted_coins.forEach((coin, index) => {
    helper.forEach((value, j) => {
      let index_check = j - coin;
      if (index_check >= 0) {
        helper[j] += helper[index_check];
      }
    });
  });
  // console.log(helper);
  return helper[helper.length - 1];
}

changeCombination(4, [1, 2, 3]);