// TODO/FIXME: Hardcoded values; future data will need to be manually added until we arrive at a better solution.

final wowneroDates = {
  "2018-5": 8725,
  "2018-6": 17533,
  "2018-7": 25981,
  "2018-8": 34777,
  "2018-9": 43633,
  "2018-10": 52165,
  "2018-11": 60769,
  "2018-12": 66817,
  "2019-1": 72769,
  "2019-2": 78205,
  "2019-3": 84805,
  "2019-4": 93649,
  "2019-5": 102277,
  "2019-6": 111193,
  "2019-7": 119917,
  "2019-8": 128797,
  "2019-9": 137749,
  "2019-10": 146377,
  "2019-11": 155317,
  "2019-12": 163933,
  "2020-1": 172861,
  "2020-2": 181801,
  "2020-3": 190141,
  "2020-4": 199069,
  "2020-5": 207625,
  "2020-6": 216385,
  "2020-7": 224953,
  "2020-8": 233825,
  "2020-9": 242709,
  "2020-10": 251380,
  "2020-11": 260283,
  "2020-12": 268989,
  "2021-1": 277980,
  "2021-2": 286915,
  "2021-3": 295026,
  "2021-4": 303886,
  "2021-5": 312575,
  "2021-6": 321589,
  "2021-7": 330206,
  "2021-8": 340128,
  "2021-9": 349071,
  "2021-10": 357625,
  "2021-11": 366417,
  "2021-12": 374840,
  "2022-1": 383728,
  "2022-2": 392437,
  "2022-3": 400527,
  "2022-4": 409413,
  "2022-5": 417913,
  "2022-6": 426711,
  "2022-7": 435191,
  "2022-8": 444096,
  "2022-9": 453084,
  "2022-10": 461720,
  "2022-11": 470521,
  "2022-12": 479124,
  "2023-1": 488058,
  "2023-2": 497086,
  "2023-3": 504961,
  "2023-4": 513844,
  "2023-5": 522370,
  "2023-6": 531126,
  "2023-7": 539780,
  "2023-8": 548545,
  "2023-9": 557465,
  "2023-10": 565885,
  "2023-11": 574587,
  "2023-12": 583019,
  "2024-1": 591878,
  "2024-2": 600734,
  "2024-3": 608821,
  "2024-4": 617750,
  "2024-5": 626324,
  "2024-6": 635220,
  "2024-7": 643863,
  "2024-8": 652652,
  "2024-9": 661455,
};

/* The data above was generated using this bash script:
#!/bin/bash

declare -A firstBlockOfTheMonth

for HEIGHT in {0..666657}
do
  TIMESTAMP=$(curl -s -X POST http://node.suchwow.xyz:34568/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"getblock","params":{"height":'$HEIGHT'}}' | jq '.result.block_header.timestamp')
  YRMO=$(date +'%Y-%m' -d "@"$TIMESTAMP) # Like "2022-11"
  if [ "${firstBlockOfTheMonth[$YRMO]+abc}" ]; then # Check if key $YRMO has been set in array firstBlockOfTheMonth.
    continue # We've already seen a block in this month.
  else # This is the first block of the month.
    echo '"'$YRMO'": '$HEIGHT
    firstBlockOfTheMonth[$YRMO]=$HEIGHT # Like firstBlockOfTheMonth["2021-5"]=312769.
  fi
  sleep 0.1
done
*/

@Deprecated("Something else should be used")
int getWowneroHeightByDate({required DateTime date}) {
  final raw = '${date.year}-${date.month}';
  final lastHeight = wowneroDates.values.last;
  int? startHeight;
  int? endHeight;
  int height = 0;

  try {
    if ((wowneroDates[raw] == null) || (wowneroDates[raw] == lastHeight)) {
      startHeight = wowneroDates.values.toList()[wowneroDates.length - 2];
      endHeight = wowneroDates.values.toList()[wowneroDates.length - 1];
      final heightPerDay = (endHeight - startHeight) / 31;
      final endDateRaw =
          wowneroDates.keys.toList()[wowneroDates.length - 1].split('-');
      final endYear = int.parse(endDateRaw[0]);
      final endMonth = int.parse(endDateRaw[1]);
      final endDate = DateTime(endYear, endMonth);
      final differenceInDays = date.difference(endDate).inDays;
      final daysHeight = (differenceInDays * heightPerDay).round();
      height = endHeight + daysHeight;
    } else {
      startHeight = wowneroDates[raw];
      final index = wowneroDates.values.toList().indexOf(startHeight!);
      endHeight = wowneroDates.values.toList()[index + 1];
      final heightPerDay = ((endHeight - startHeight) / 31).round();
      final daysHeight = (date.day - 1) * heightPerDay;
      height = startHeight + daysHeight - heightPerDay;
    }
  } catch (e) {
    // print(e);
    rethrow;
  }

  return height;
}
