class SevaBlocRepository {

  static const _delay = Duration(milliseconds: 300);
  Future<void> wait() => Future.delayed(_delay);


    Future<List<String>> fetchSeva() async {
      await wait();
      return [
        'Morning seva',
        'Afternoon seva',
        'Evening seva',
        'Darshanam',
      ];
    }

    Future<List<String>> fetchSevadetails({String seva}) async {
      await wait();
      switch (seva) {
        case 'Morning seva':
          return [
            'Suprabhatha Seva	',
            'Astavidha Maha Mangala Harathi	',
            'Nithya Kalyanam',
          ];
        case 'Darshanam' :
          return [
            'Seeghra Darshan	',
            'Sparsha Darshan',
            'Nijaroopa Darshan',
            'Mahadhaaseervachana Darshanam',
            'Rudrabhishekam for Couples	',
            'Ksheer Abhishekam for couple	'
          ];
        case 'Evening seva':
          return ['Astavidha Maha Mangala Harathi	'];
        case 'Night seva':
          return ['Ekantha Seva	'];
        default:
          return [];
      }
    }

    Future<List<String>> fetchTimings({String seva, String sevadetail}) async {
      await wait();
      switch (seva) {
        case 'Morning seva':
          switch (sevadetail) {
            case 'Suprabhatha Seva':
              return ['4:30 a.m. to 5:00 a.m.'];
            case 'Astavidha Maha Mangala Harathi':
              return ['5:30 to 6:30 a.m.'];
            case 'Nijaroopa Darshan':
              return [
                '8:00 am to 9:00 am',
                '11:00 am to 12:00 pm	',
                '7:00 pm to 8:00 pm'
              ];
            case 'Nithya Kalyanam	':
              return ['11:00 am'];
            default:
              return [];
          }
          break;
        case 'Darshanam':
          switch (sevadetail) {
            case 'Seeghra Darshan':
              return [
                '6:30 am to 8:00 am	',
                '9:00 am to 11:00 am	',
                '12:00 pm to 12:30 pm	',
                '2:00 pm to 5:30 pm	',
                '6:30 pm to 7:00 pm	',
                '8:00 pm to 9:00 pm	'
              ];
            case 'Sparsha Darshan':
              return [
                '6:30 am to 8:00 am	',
                '9:00 am to 11:00 am	',
                '12:00 pm to 12:30 pm	',
                '2:00 pm to 5:30 pm	',
                '6:30 pm to 7:00 pm	',
                '8:00 pm to 9:00 pm	'
              ];
            case 'Nijaroopa Darshan':
              return [
                '6:30 am to 8:00 am	',
                '9:00 am to 11:00 am	',
                '12:00 pm to 12:30 pm	',
                '2:00 pm to 5:30 pm	',
                '6:30 pm to 7:00 pm	',
                '8:00 pm to 9:00 pm	'
              ];
            case 'Mahadhaaseervachana Darshanam':
              return [
                '6:30 am to 8:00 am	',
                '9:00 am to 11:00 am	',
                '12:00 pm to 12:30 pm	',
                '2:00 pm to 5:30 pm	',
                '6:30 pm to 7:00 pm	',
                '8:00 pm to 9:00 pm	'
              ];
            case 'Rudrabhishekam for Couples':
              return [
                '6:30 am to 8:00 am	',
                '9:00 am to 11:00 am	',
                '12:00 pm to 12:30 pm	',
                '2:00 pm to 5:30 pm	',
                '6:30 pm to 7:00 pm	',
                '8:00 pm to 9:00 pm	'
              ];
            case 'Ksheerabhishekam for couple':
              return [
                '6:30 am to 8:00 am	',
                '9:00 am to 11:00 am	',
                '12:00 pm to 12:30 pm	',
                '2:00 pm to 5:30 pm	',
                '6:30 pm to 7:00 pm	',
                '8:00 pm to 9:00 pm	'
              ];
            default:
              return [];
          }
          break;
        case 'Evening Seva':
          switch (sevadetail) {
            case 'Astavidha Maha Mangala Harathi':
              return ['5:30 pm to 6:30 pm	'];
            default:
              return [];
          }
          break;
        case 'Night Seva':
          switch (sevadetail) {
            case 'Ekantha Seva':
              return ['9:00 pm to 9:30 pm	'];
            default:
              return [];
          }
          break;
        default:
          return [];
      }
    }

    Future<List<String>> fetchTimingswiserate(
        {String seva, String sevadetail, String time}) async {
      await wait();
      switch (seva) {
        case 'Morning seva':
          switch (sevadetail) {
            case 'Suprabhatha Seva':
              switch (time) {
                case '4:30 a.m. to 5:00 a.m.':
                  return ['100'];
              }
          }
          switch (sevadetail) {
            case 'Astavidha Maha Mangala Harathi	':
              switch (time) {
                case '5:30 am to 6:30 am	':
                  return ['100'];
              }
          }
          switch (sevadetail) {
            case 'Nithya Kalyanam':
              switch (time) {
                case '11:00 am':
                  return ['1116'];
              }
          }
          break;
        default:
          return [];
      }
      switch (seva) {
        case 'Darshanam':
          switch (sevadetail) {
            case 'Seeghra Darshan':
              switch (time) {
                case '4:30 a.m. to 5:00 a.m.':
                case '6:30 am to 8:00 am	':
                case '9:00 am to 11:00 am	':
                case '12:00 pm to 12:30 pm	':
                case '2:00 pm to 5:30 pm	':
                case '6:30 pm to 7:00 pm	':
                case '8:00 pm to 9:00 pm	':
                  return ['20'];
              }
          }
          switch (sevadetail) {
            case 'Sparsha Darshan':
              switch (time) {
                case '4:30 a.m. to 5:00 a.m.':
                case '6:30 am to 8:00 am	':
                case '9:00 am to 11:00 am	':
                case '12:00 pm to 12:30 pm	':
                case '2:00 pm to 5:30 pm	':
                case '6:30 pm to 7:00 pm	':
                case '8:00 pm to 9:00 pm	':
                  return ['100'];
              }
          }
          switch (sevadetail) {
            case 'Nijaroopa Darshan':
              switch (time) {
                case '4:30 a.m. to 5:00 a.m.':
                case '6:30 am to 8:00 am	':
                case '9:00 am to 11:00 am	':
                case '12:00 pm to 12:30 pm	':
                case '2:00 pm to 5:30 pm	':
                case '6:30 pm to 7:00 pm	':
                case '8:00 pm to 9:00 pm	':
                  return ['50'];
              }
          }
          switch (sevadetail) {
            case 'Mahadhaaseervachana Darshanam':
              switch (time) {
                case '4:30 a.m. to 5:00 a.m.':
                case '6:30 am to 8:00 am	':
                case '9:00 am to 11:00 am	':
                case '12:00 pm to 12:30 pm	':
                case '2:00 pm to 5:30 pm	':
                case '6:30 pm to 7:00 pm	':
                case '8:00 pm to 9:00 pm	':
                  return ['351'];
              }
          }
          switch (sevadetail) {
            case 'Rudrabhishekam for Couples':
              switch (time) {
                case '4:30 a.m. to 5:00 a.m.':
                case '6:30 am to 8:00 am	':
                case '9:00 am to 11:00 am	':
                case '12:00 pm to 12:30 pm	':
                case '2:00 pm to 5:30 pm	':
                case '6:30 pm to 7:00 pm	':
                case '8:00 pm to 9:00 pm	':
                  return ['1000'];
              }
          }
          switch (sevadetail) {
            case 'Ksheerabhishekam for couple':
              switch (time) {
                case '4:30 a.m. to 5:00 a.m.':
                case '6:30 am to 8:00 am	':
                case '9:00 am to 11:00 am	':
                case '12:00 pm to 12:30 pm	':
                case '2:00 pm to 5:30 pm	':
                case '6:30 pm to 7:00 pm	':
                case '8:00 pm to 9:00 pm	':
                  return ['1000'];
              }
          }
          switch (seva) {
            case 'Evening Seva':
              switch (sevadetail) {
                case 'Astavidha Maha Mangala Harathi':
                  switch (time) {
                    case '5:30 pm to 6:30 pm':
                      return ['100'];
                  }
              }
              break;
            default:
              return [];
          }

          switch (seva) {
            case 'Night Seva':
              switch (sevadetail) {
                case 'Ekantha Seva':
                  switch (time) {
                    case '9:00 pm to 9:30 pm':
                      return ['50'];
                  }
              }
              break;
            default:
              return [];
          }
      }
      return [];
    }
  }