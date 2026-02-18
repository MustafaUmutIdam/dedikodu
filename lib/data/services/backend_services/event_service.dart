import '../../models/backend_models/event_model.dart';

class EventService {
  Future<List<Event>> getEvents() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));

    return [
      Event(
          id: '1',
          title: 'Okey Oynama',
          imageUrl:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBcSDgHUJoRAQsCSsK7I3KvEgWnN-iOX5a6KN132xoaQEwsDWPNcXlGb1i8PxrKAT8HMSJyrs5BW6xJY54CURBNCtlzM0uWTiVeGtOcgLGjWYSbw8vPuAeZh1rlZA-lQgRW4Q8mBDL2w5gJkZEFf_HOeG1ZC005zKhmtDOkcNBlDy8A_qT6Gb4hJbuuwY0NMK-1nfNiEx2ehToW82jirXndLOObtau3GeQDf9if7gC3rE6IpHZCGugdYvFLyIbBB6U1bzFp5aLdozE',
          time: '18:00',
          locationName: 'Kahve Dünyası',
          currentParticipants: 3,
          maxParticipants: 4,
          participantAvatars: [
            'https://lh3.googleusercontent.com/aida-public/AB6AXuC8InpInuA3JmKwGLQxG9rJFjsXFyYdfYa6fqDdv0BP2zaA5H--e3v3u_fqjgrNWV0lI6dDluWpCzcGwrK4cqr3A3IF5L69ZsKW04pzZ39sQXe0XzpVE0fSSO6Bf-2X_QvLnvLQ0EvVEa-1A8PAQVz9XFqG3cIkDM6rIfZPGfRJdLoLrF-31tcMUpa9wvkMhly-Bq__n4A07tDnuVyRVZ7FGbUg-s6xJIA9VPQzj3kRFRNwpAmaXBGcMyPQHO-CVFO6i8VQNhmVtEA',
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBTG496RV_OW0eOj3WNNEV_zTkVkmhEY37ZYrQXXwfknapj6-Vkp33UBE6pr35RarJjJyAa3fqW2zBkfG8UD0LrmmaKwqaRIBc-TvRHPhEkxnWeMiQRkI1xWueF11fpnDD7PWiv0-vztX_5VvwPUXj0sh-jRxdechA1waBmOm2s8I95ehkD_cUsBCZ6oFeje0TbSoK6ppqzEiIVpG04UA5rPmnJWYTcPu3ONxY3yzwgPGqjOkMCvJCk5gT5V4BKWsQLGHFRwvBKPJ4',
          ],
          category: 'Oyunlar'),
      Event(
          id: '2',
          title: 'Köpek Gezdirme',
          imageUrl:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuC7wXFxohaGqBNjUui9i7MWQ2q7Wvkg1BkHO-X0M8_VGqS0YPQVJXAqDHIV982cSBa7gjShqTM7IJI4MdWft57NkVCgOl3Qe_bX_VL310r3c7QcAhMi1qey7PvtiK0tK_5ksxB08cskkaOF5z9nKTOt9wiQJMZt86Ob_zVkKYd0iSlUesbALwkcGwiF0_P6vSbLP3ogdUN5oF_2T8cVhQ30mqFNOaP41cA9YBPBOgegUAnxRRy57ZZFydQfdVfy3uxVIq-hrYsO32o',
          time: '19:30',
          locationName: 'Yoğurtçu Parkı',
          currentParticipants: 2,
          maxParticipants: 6,
          participantAvatars: [
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAqA1hb2kiQVS-N9ht-NEXWUjrRnEZhMvWK4ezT7g7o5pNxUnsxpUyaLNELmJ5Zv2XorbUqsLtY-WIcKitfWpyy8xjfowpgKRKWcDQ4B1ee112jTRrqraQP_LnfaSyu3W296PgLhKDeyur8mmf_JE_WDQ09yY4nud391V3LykDli3VIzBZIPh2U33tloFsuxQj7DA5VuaMONuaFjupWFBg5xpeUrDfbgUTVpleaP_0L3Fp0ojG-rlerPHGe-T0gCKhi0gTHdtr6Ctk',
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAX46dItD8wutt43--S5Q0ShsE2m0GCDDK12FvCLhPUkB5xGH6wnq3JdDDuxfB6819QsQOMG5CAJIreGVf-tx_M-eiRRc-xqwFNfWjygmKlP_sp-liaiDA4NXYSp3gcaQ8sNDK0wxMVzGB9_m2TUQPk2iVKfGn1I-g-En5w-lcsL_x9gR_q01sXyR7Nz3jJusQ9SfkgnX3B-rMXnc-LWCSR1r0cbV7VN_BDKHhjIgHw_QcKoVjAwXKCRwh9BfwkWWUTsIU53Xg0L3M',
          ],
          category: 'Evcil Hayvan'),
      Event(
          id: '3',
          title: 'Parkta Buluşma',
          imageUrl:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBo-BLI9bhNvcvb16reTWIhBR5hyntzHXQHiMqXho0mRkCSIwV5gpTXNBClAFfFl1HSe4S9N5tYG5oWQmOhBPTe_gxklHUAcRGFK5Pivq6ETOr7-dZgAHR1KWN5EML2kEgDf67DpsZssV0AN_x2IGmRcWm9Rf_c3RTfxFXaWn-65WRP_2T7GlZ-28JVQj43cFhPbZLSVKm5GunuseK4gaiQKYYxyWiBQKpKx2Sw1O8iTdbaOjf9GzMCQ3gjFhrOpnsVWG_wYAkceAQ',
          time: 'Yarın, 14:00',
          locationName: 'Moda Sahil',
          currentParticipants: 1,
          maxParticipants: 10,
          participantAvatars: [
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDHzvzON5yn-0v2XePT0H64yq1paYmb4p79Y7fGl4bh2dViezSRj_ESS2Omfv6sY9g39TBYs0VqZCIGZx1GYRsfOnrRrp6ViQ-eOkh8PVCqxwr-0pr7N__EeiumOGZZm-MGXB4hhwaHVvuamzKWQE4VHpC7Ow3vM89uf8bJsr-cjnIQP4nLkQmm5BhPdn8lxMey70CqzuerHHgMqWHIkFUCCbH0JtlC96G5F9YWGYglXDdQmh9uTMxpb21UxPwreTEVrn2RqmpY_n4',
          ],
          category: 'Dış Mekan'),
    ];
  }
}
