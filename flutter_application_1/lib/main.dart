import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Glad to see you,',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                'Esther Howard!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Find your favorite club',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 16),
              LiveMatchCard(),
              SizedBox(height: 16),
              FinishedMatchCard(
                league: 'Champions League',
                date: 'Yesterday',
                homeTeam: 'Juventus',
                awayTeam: 'Paris S-G',
                homeScore: 1,
                awayScore: 0,
                topPlayer: 'Paulo Dybala',
                homeShots: 11,
                awayShots: 14,
                homeShotsOnTarget: 4,
                awayShotsOnTarget: 2,
                homePossession: 64,
                awayPossession: 36,
              ),
              SizedBox(height: 16),
              FinishedMatchCard(
                league: 'League B',
                date: '15 July 2020',
                homeTeam: 'Bayern',
                awayTeam: 'Dortmund',
                homeScore: 0,
                awayScore: 2,
              ),
              SizedBox(height: 80), // Tambahkan padding di bawah agar BottomNavigationBar tidak menutupi konten
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}


class LiveMatchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Match',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Premier League'),
                Text('78\''),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      image : AssetImage('images/arsenal.png'),
                      width: 70,
                      height: 70,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: $error');
                        return Icon(Icons.error);
                      },
                    ),
                    Text('Arsenal'),
                  ],
                ),
                SizedBox(width: 16),
                Text(
                  '2 : 1',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Image(
                      image : AssetImage('images/chelsea.png'),
                      width: 70,
                      height: 70,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: $error');
                        return Icon(Icons.error);
                      },
                    ),
                    Text('Chelsea'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Live'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinishedMatchCard extends StatelessWidget {
  final String league;
  final String date;
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String? topPlayer;
  final int? homeShots;
  final int? awayShots;
  final int? homeShotsOnTarget;
  final int? awayShotsOnTarget;
  final int? homePossession;
  final int? awayPossession;

  FinishedMatchCard({
    required this.league,
    required this.date,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    this.topPlayer,
    this.homeShots,
    this.awayShots,
    this.homeShotsOnTarget,
    this.awayShotsOnTarget,
    this.homePossession,
    this.awayPossession,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(league),
            Text(date),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image(
                      image : AssetImage('images/juventus.jpeg'),
                      width: 70,
                      height: 70,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: $error');
                        return Icon(Icons.error);
                      },
                    ),
                    Text(homeTeam),
                  ],
                ),
                Text(
                  '$homeScore : $awayScore',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Image(
                      image : AssetImage('images/psg.jpeg'),
                      width: 70,
                      height: 70,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: $error');
                        return Icon(Icons.error);
                      },
                    ),
                    Text(awayTeam),
                  ],
                ),
              ],
            ),
            if (topPlayer != null) ...[
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/dybala.jpeg'), 
                    radius: 12,
                  ),
                  SizedBox(width: 8),
                  Text('Top Player: $topPlayer'),
                ],
              ),
            ],
            if (homeShots != null && awayShots != null) ...[
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Shots: $homeShots'),
                  Text('Total Shots: $awayShots'),
                ],
              ),
            ],
            if (homeShotsOnTarget != null && awayShotsOnTarget != null) ...[
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shots on Target: $homeShotsOnTarget'),
                  Text('Shots on Target: $awayShotsOnTarget'),
                ],
              ),
            ],
            if (homePossession != null && awayPossession != null) ...[
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Possession: $homePossession%'),
                  Text('Possession: $awayPossession%'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
