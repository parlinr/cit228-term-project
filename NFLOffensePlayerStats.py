#this one scrapes player data from espn.com/nfl/boxscore...
#sack numbers for QBs will be separated into number of sacks and yards lost due to sacks
#takes two arguments: the ESPN gameId and the week number of the season (1-17) with no flags
#e.g. NFLOffensePlayerStats.py 1234567890
#last modified: 2017-08-07

#import packages
import re
import sys
from urllib.request import urlopen
from urllib.error import HTTPError
from bs4 import BeautifulSoup
import lxml

def get_player_position(p):
    player_page = urlopen(str(p[0]))
    player_page_object = BeautifulSoup(player_page, "lxml")
    raw_number_text = player_page_object.find("div", {"class":"bg-elements"}).find("div", {"id":"subheader"}).find("div", {"id":"content-wrapper"}).find("div", {"id":"content"}).find("div", {"class":"mod-container mod-no-header-footer mod-page-header"}).find("div", {"class":"mod-content"}).find("div", {"class":"player-bio"})
    p_test = open("playerPositionTest.txt", "w")
    p_test.write(str(raw_number_text))
    p_test.close()
    position_re = re.compile('<li class="first">.{2,3} ([a-zA-Z]+)</li>')
    position = position_re.findall(str(raw_number_text))
    return position


#find the date of the game
gameId = str(sys.argv[1])
week_number = 13
date_url = "http://www.espn.com/nfl/game?gameId=" + gameId
date_page = urlopen(date_url)
date_page_object = BeautifulSoup(date_page, "lxml")
date_container = date_page_object.find("div", {"class":"game-date-time"})
date_re = re.compile('<span.*data-date="([0-9-:A-Z]+)"')
date = date_re.findall(str(date_page_object))
game_date = date[0].split("T")



#get the page structure
boxscore_url = "http://www.espn.com/nfl/boxscore?gameId=" + gameId
page = urlopen(boxscore_url)
page_object = BeautifulSoup(page, "lxml")

#find out who the away team is
away1 = page_object.find("div", {"class":"team away"}).find("div", {"class":"team__content"}).find("div", {"class":"team-container"}).find("div", {"class":"team-info"}).find("div", {"class":"team-info-wrapper"}).find("a")
away2 = page_object.find("div", {"class":"team away"}).find("div", {"class":"team__content"}).find("div", {"class":"team-container"}).find("div", {"class":"team-info"}).find("div", {"class":"team-info-wrapper"}).find("div", {"class":"team-name"})
away_re = re.compile('<span class="long-name">([a-zA-Z\u0020.]+)</span><span class="short-name">([a-zA-Z0-9]+)</span>')
away_array_1 = away_re.findall(str(away1))
away_array_2 = away_re.findall(str(away2))
away_long_name = ""
away_short_name = ""
if (away_array_1):
    away_long_name = away_array_1[0][0]
    away_short_name = away_array_1[0][1]	
else:
    away_long_name = away_array_2[0][0]
    away_short_name = away_array_2[0][1]

#find out who the home team is
home1 = page_object.find("div", {"class":"team home"}).find("div", {"class":"team__content"}).find("div", {"class":"team-container"}).find("div", {"class":"team-info"}).find("div", {"class":"team-info-wrapper"}).find("a")
home2 = page_object.find("div", {"class":"team home"}).find("div", {"class":"team__content"}).find("div", {"class":"team-container"}).find("div", {"class":"team-info"}).find("div", {"class":"team-info-wrapper"}).find("div", {"class":"team-name"})
home_re = re.compile('<span class="long-name">([a-zA-Z\u0020.]+)</span><span class="short-name">([a-zA-Z0-9]+)</span>')
home_array_1 = home_re.findall(str(home1))
home_array_2 = home_re.findall(str(home2))
home_long_name = ""
home_short_name = ""
if (home_array_1):
    home_long_name = home_array_1[0][0]
    home_short_name = home_array_1[0][1]
else:
    home_long_name = home_array_2[0][0]
    home_short_name = home_array_2[0][1]


#scrape the data
away_passing = page_object.find("div", {"id":"global-viewport"}).find("section", {"id":"pane-main"}).find("section", {"id":"main-container"}).find("div", {"id":"gamepackage-wrap"}).find("div", {"id":"gamepackage-content-wrap"}).find("div", {"id":"gamepackage-column-wrap"}).find("div", {"class":"col-b"}).find("div", {"id":"gamepackage-box-score"}).find("article", {"class":"boxscore-tabs game-package-box-score"}).find("div", {"id":"gamepackage-passing"}).find("div", {"class":"row-wrapper"}).find("div", {"class":"col column-one gamepackage-away-wrap"}).find("div", {"class":"sub-module"}).find("div", {"class":"content hide-bench desktop"}).find("table", {"class":"mod-data"}).find("tbody")

away_rushing = page_object.find("div", {"id":"global-viewport"}).find("section", {"id":"pane-main"}).find("section", {"id":"main-container"}).find("div", {"id":"gamepackage-wrap"}).find("div", {"id":"gamepackage-content-wrap"}).find("div", {"id":"gamepackage-column-wrap"}).find("div", {"class":"col-b"}).find("div", {"id":"gamepackage-box-score"}).find("article", {"class":"boxscore-tabs game-package-box-score"}).find("div", {"id":"gamepackage-rushing"}).find("div", {"class":"row-wrapper"}).find("div", {"class":"col column-one gamepackage-away-wrap"}).find("div", {"class":"sub-module"}).find("div", {"class":"content hide-bench desktop"}).find("table", {"class":"mod-data"}).find("tbody")

away_receiving = page_object.find("div", {"id":"global-viewport"}).find("section", {"id":"pane-main"}).find("section", {"id":"main-container"}).find("div", {"id":"gamepackage-wrap"}).find("div", {"id":"gamepackage-content-wrap"}).find("div", {"id":"gamepackage-column-wrap"}).find("div", {"class":"col-b"}).find("div", {"id":"gamepackage-box-score"}).find("article", {"class":"boxscore-tabs game-package-box-score"}).find("div", {"id":"gamepackage-receiving"}).find("div", {"class":"row-wrapper"}).find("div", {"class":"col column-one gamepackage-away-wrap"}).find("div", {"class":"sub-module"}).find("div", {"class":"content hide-bench desktop"}).find("table", {"class":"mod-data"}).find("tbody")

home_passing = page_object.find("div", {"id":"global-viewport"}).find("section", {"id":"pane-main"}).find("section", {"id":"main-container"}).find("div", {"id":"gamepackage-wrap"}).find("div", {"id":"gamepackage-content-wrap"}).find("div", {"id":"gamepackage-column-wrap"}).find("div", {"class":"col-b"}).find("div", {"id":"gamepackage-box-score"}).find("article", {"class":"boxscore-tabs game-package-box-score"}).find("div", {"id":"gamepackage-passing"}).find("div", {"class":"row-wrapper"}).find("div", {"class":"col column-two gamepackage-home-wrap"}).find("div", {"class":"sub-module"}).find("div", {"class":"content hide-bench desktop"}).find("table", {"class":"mod-data"}).find("tbody")

home_rushing = page_object.find("div", {"id":"global-viewport"}).find("section", {"id":"pane-main"}).find("section", {"id":"main-container"}).find("div", {"id":"gamepackage-wrap"}).find("div", {"id":"gamepackage-content-wrap"}).find("div", {"id":"gamepackage-column-wrap"}).find("div", {"class":"col-b"}).find("div", {"id":"gamepackage-box-score"}).find("article", {"class":"boxscore-tabs game-package-box-score"}).find("div", {"id":"gamepackage-rushing"}).find("div", {"class":"row-wrapper"}).find("div", {"class":"col column-two gamepackage-home-wrap"}).find("div", {"class":"sub-module"}).find("div", {"class":"content hide-bench desktop"}).find("table", {"class":"mod-data"}).find("tbody")

home_receiving = page_object.find("div", {"id":"global-viewport"}).find("section", {"id":"pane-main"}).find("section", {"id":"main-container"}).find("div", {"id":"gamepackage-wrap"}).find("div", {"id":"gamepackage-content-wrap"}).find("div", {"id":"gamepackage-column-wrap"}).find("div", {"class":"col-b"}).find("div", {"id":"gamepackage-box-score"}).find("article", {"class":"boxscore-tabs game-package-box-score"}).find("div", {"id":"gamepackage-receiving"}).find("div", {"class":"row-wrapper"}).find("div", {"class":"col column-two gamepackage-home-wrap"}).find("div", {"class":"sub-module"}).find("div", {"class":"content hide-bench desktop"}).find("table", {"class":"mod-data"}).find("tbody")

#write the scraped data to an external file
test_file = open("test.txt", "w")
for row in away_passing:
    test_file.write("Passing -- Away")
    test_file.write(str(row))
    test_file.write("\n\n")

for row in away_rushing:
    test_file.write("Rushing -- Away")
    test_file.write(str(row))
    test_file.write("\n\n")

for row in away_receiving:
    test_file.write("Receiving -- Away")
    test_file.write(str(row))
    test_file.write("\n\n")
	
for row in home_passing:
    test_file.write("Passing -- Home")
    test_file.write(str(row))
    test_file.write("\n\n")
	
for row in home_rushing:
    test_file.write("Rushing -- Home")
    test_file.write(str(row))
    test_file.write("\n\n")
	
for row in home_receiving:
    test_file.write("Receiving -- Home")
    test_file.write(str(row))
    test_file.write("\n\n")
test_file.close()

#read the scraped data file into memory
test_file = open("test.txt", "r")
test_file_text = test_file.read()
test_file.close()

#filter the data with regular expressions
away_passing_re = re.compile('Passing -- Away<tr><td class="name"><a href="([a-zA-Z0-9/_:.-]+)".*<span>([a-zA-Z]+)\u0020([a-zA-Z]+)</span>.*<td class="c-att">(\d+)/(\d+)</td><td class="yds">([-0-9]+)</td><td class="avg">([0-9.]+)</td><td class="td">(\d+)</td><td class="int">([-0-9]+)</td><td class="sacks">([-0-9]+)-([-0-9]+)</td><td class="qbr">([0-9.]+)</td><td class="rtg">([0-9.]+)</td>')

away_rushing_re = re.compile('Rushing -- Away<tr><td class="name"><a href="([a-zA-Z0-9/_:.-]+)".*<span>([a-zA-Z]+)\u0020([a-zA-Z]+)</span>.*<td class="car">([-0-9]+)</td><td class="yds">([-0-9]+)</td><td class="avg">([-0-9.]+)</td><td class="td">([-0-9]+)</td><td class="long">([-0-9]+)</td>')

away_receiving_re = re.compile('Receiving -- Away<tr><td class="name"><a href="([a-zA-Z0-9/_:.-]+)".*<span>([a-zA-Z]+)\u0020([a-zA-Z]+)</span>.*<td class="rec">(\d+)</td><td class="yds">([-0-9]+)</td><td class="avg">([-0-9.]+)</td><td class="td">(\d+)</td><td class="long">([-0-9.]+)</td><td class="tgts">(\d+)</td>')

home_passing_re = re.compile('Passing -- Home<tr><td class="name"><a href="([a-zA-Z0-9/_:.-]+)".*<span>([a-zA-Z]+)\u0020([a-zA-Z]+)</span>.*<td class="c-att">(\d+)/(\d+)</td><td class="yds">([-0-9]+)</td><td class="avg">([0-9.]+)</td><td class="td">(\d+)</td><td class="int">([-0-9]+)</td><td class="sacks">([-0-9]+)-([-0-9]+)</td><td class="qbr">([0-9.]+)</td><td class="rtg">([0-9.]+)</td>')

home_rushing_re = re.compile('Rushing -- Home<tr><td class="name"><a href="([a-zA-Z0-9/_:.-]+)".*<span>([a-zA-Z]+)\u0020([a-zA-Z]+)</span>.*<td class="car">([-0-9]+)</td><td class="yds">([-0-9]+)</td><td class="avg">([-0-9.]+)</td><td class="td">([-0-9]+)</td><td class="long">([-0-9]+)</td>')

home_receiving_re = re.compile('Receiving -- Home<tr><td class="name"><a href="([a-zA-Z0-9/_:.-]+)".*<span>([a-zA-Z]+)\u0020([a-zA-Z]+)</span>.*<td class="rec">(\d+)</td><td class="yds">([-0-9]+)</td><td class="avg">([-0-9.]+)</td><td class="td">(\d+)</td><td class="long">([-0-9.]+)</td><td class="tgts">(\d+)</td>')


away_passing_stats = away_passing_re.findall(test_file_text)
away_rushing_stats = away_rushing_re.findall(test_file_text)
away_receiving_stats = away_receiving_re.findall(test_file_text)
home_passing_stats = home_passing_re.findall(test_file_text)
home_rushing_stats = home_rushing_re.findall(test_file_text)
home_receiving_stats = home_receiving_re.findall(test_file_text)

#ship the data to the database
#connection = pypyodbc.connect('Driver={SQL Server};'
#							  'Server=tcp:parlinrtest.database.windows.net,1433;'
#							  'Database=test;'
#							  'uid=testadmin;'
#							  'pwd=Whatthehell1'



passing = open("passing.txt","a+")
for player in away_passing_stats:
    record = "('" + player[2] + "','" + player[1] + "','2017','" + str(week_number) + "','" + player[7] + "','" + player[8] + "','" + player[5] + "'),"
    passing.write(record)
    passing.write("\n")
passing.close()

rushing = open("rushing.txt","a+")
for player in away_rushing_stats:
    rushing.write("('" + player[2] + "','" + player[1] + "','2017','" + str(week_number) + "','" + player[4] + "','" + player[6] + "'),")
    rushing.write("\n")
rushing.close()

receiving = open("receiving.txt","a+")
for player in away_receiving_stats:
    position = get_player_position(player)
    receiving.write("('" + player[2] + "','" + player[1] + "','2017','" + str(week_number) + "','" + player[3] + "','" + player[4] + "','" + player[6] + "')," + str(position)) 
    receiving.write("\n")
receiving.close()


    


