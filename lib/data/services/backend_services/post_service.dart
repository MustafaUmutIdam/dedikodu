import 'package:dedikodu/data/models/backend_models/comment_model.dart';
import 'package:dedikodu/data/models/backend_models/post_model.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));

    return [
      Post(
        id: '1',
        userName: 'Ahmet Yılmaz',
        userAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBHCZckBqYFrd7UghdJX0NoPMPERgD_Ni5-6d86yXibRi2SGs-M1jAsGKZsHqsqiZAy3Zs4AEmcd6JaI1t8cFSU3qL2O9bOejZB8Og-LQG85rYYR6EnT_sfgAzkO4ata4t-tyGYND92jBWpfLSNwx8yIR2p_cQtcNb_KL-87xAVmnl4mpfSo90jef9_MTmiPkhFR7j619mgvp3zfbKn2Ya5B8Bpzy1Qi3--uvs513MrW4SHk_Dut_gWePKGnINEAe0y5ttKpAwPC4M',
        timeAgo: '2 saat önce',
        category: 'Yardımlaşma',
        content:
            'Akatlar parkında anahtarını düşüren var mı? Bankın üzerinde buldum, yanıma aldım. Sahibi bana ulaşabilir mi?',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuA_8atBWtTz4Y8FXZA_JjW-6EoMaaFkZfyPndCvj19sBuB-lQWh-623yorU8EeL5j2p65vnf3f7fguYHXxbiP3IqAbxEnWAlaLbHV1Bbr8NgJWDQqNIC3moDyWI1erstmcKEZ6bljLIM7RvphoQrFYpsUMYRlLkA6b9F7rwwj0nbOX_vZjpwhSSQVqS7wkPuzcGo4h38MlNKOOHLC5fTbYDisEPsAwG8-L6ZpglGZvCo2tT1aFLRuPshJfqSZ2SWLb7TskRbdvOty8',
        likeCount: 12,
        commentCount: 4,
        isEvent: false,
      ),
      Post(
        id: '2',
        userName: 'Ayşe Demir',
        userAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCWnKby6_77qQPnPO2HupS1bMa8pftyZ2xKsrtxnbASuvxISWJTwMncH859soWGVBhIS-dLIeOxTGTCCMSTq6jsZJTBcPLvl4r22PG-6KgxfLMW1ueqCZHbVuYJurHMoGNm4kBKYywoHD7yVIQGUwn1mJrhrEygzeuMHU70dHTKGcqangmx25nrA2dSq7mDqY71kvfl-5uxkIUWht3KXinl8DhJ1VIYiwlEO4cqGoLVuhXQd-ZssaLUtFi0VaAQfhj0WOSbg74hssQ',
        timeAgo: '5 saat önce',
        category: 'Sohbet',
        content:
            'Pazar günü mahalle pazarında inanılmaz taze çilekler vardı! Akatlar pazarı her zamanki gibi harika. Haftaya gitmek isteyenlerle orada buluşabiliriz 🍓',
        likeCount: 28,
        commentCount: 7,
        isEvent: false,
      ),
      Post(
        id: '3',
        userName: 'Can Berk',
        userAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDg0CCH_wRaWBuvRcmEsqXl1qjClTt6vfg-QcLIH93JEcbRCMTa0l1ADAyKTt2i-Dosm5XVGECmj5qOyrwv-DkGtfCVyBeGW_Cb8y8QwA-JOQ5dRMyRIBL0FOBG2cNjfEKW3MUrk-JXm78pwzyPXH9TTibpc3JZD1xA6eDUU0h4xwyG3ynA6MqMgUQ9tAelLX6ZGHpB2ymbKDnIIwAuNsBTtLgUou5EY_vVSOERjSYhe2F_3ZO7AYrNfx4RD1GK_tYlsR2OCd-TDbY',
        timeAgo: 'Dün',
        category: 'Etkinlik',
        content:
            'Bu Cumartesi sabahı mahallemizdeki basketbol sahasında 3\'e 3 maç yapıyoruz. Gelmek isteyen var mı? Seviye fark etmez, maksat spor olsun! 🏀',
        likeCount: 15,
        commentCount: 3,
        isEvent: true,
      ),
    ];
  }

  Future<Post> getPostDetails(String postId) async {
    // Simulate a network request
    await Future.delayed(const Duration(milliseconds: 500));
    final posts = await getPosts();
    return posts.firstWhere((post) => post.id == postId);
  }

  Future<List<Comment>> getComments(String postId) async {
    // Simulate a network request
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Comment(id: '1', userName: 'Selin Kaya', userAvatar: 'https://randomuser.me/api/portraits/women/68.jpg', text: 'Harika bir fikir! Ben de katılmak isterim.', timeAgo: '1 saat önce'),
      Comment(id: '2', userName: 'Mehmet Öztürk', userAvatar: 'https://randomuser.me/api/portraits/men/32.jpg', text: 'Saat kaçta buluşulacak?', timeAgo: '45 dakika önce'),
    ];
  }
}
