import '../models/forum_comment_model.dart';
import '../models/forum_post_model.dart';
import '../models/mentor_model.dart';

const List<ForumPostModel> communityForumPosts = [
  ForumPostModel(
    category: 'BACKEND',
    title: 'Cara Deploy Aplikasi React',
    description:
        'Halo teman-teman, saya baru saja merangkum langkah-langkah praktis...',
    time: '3 menit lalu',
    replies: 67,
    likes: 128,
    views: 452,
  ),
  ForumPostModel(
    category: 'DESIGN UI/UX',
    title: 'Ada masalah dengan CSS saya: Grid Layout tidak responsif',
    description:
        'Sudah mencoba menggunakan media queries tapi tampilan di mobile tetap berantakan. Mohon bantuannya master...',
    time: '2 jam lalu',
    replies: 19,
    likes: 128,
  ),
  ForumPostModel(
    category: 'DATA SCIENCE',
    title: 'Rekomendasi Library Python untuk Visualisasi Data',
    description:
        'Selain Matplotlib dan Seaborn, apakah ada library lain yang lebih interaktif untuk dashboard?',
    time: '5 jam lalu',
    replies: 30,
    likes: 128,
  ),
  ForumPostModel(
    category: 'SOFT SKILLS',
    title: 'Cara Membangun Networking di LinkedIn untuk Pemula',
    description:
        'Bagaimana etika mengirim pesan koneksi ke HRD atau senior dev tanpa terlihat spamming?',
    time: '1 hari lalu',
    replies: 42,
    likes: 128,
  ),
];

const List<ForumCommentModel> forumComments = [
  ForumCommentModel(
    name: 'Rudi',
    time: '1 jam yang lalu',
    comment:
        'Saran saya gunakan Vercel atau Netlify. Keduanya sangat terintegrasi dengan GitHub. Cukup hubungkan repo kamu, dan setiap kali kamu push, aplikasi akan otomatis ter-deploy.',
    code:
        '// Langkah simpel via CLI\n\nnpm install -g vercel\nvercel login\nvercel deploy',
    likes: 24,
    imagePath: 'assets/image/rudi.png',
  ),
  ForumCommentModel(
    name: 'Bambang',
    time: '45 menit yang lalu',
    comment:
        'Setuju sama bang Rudi. Tapi jangan lupa atur environment variables kalau kamu pakai API key eksternal di Vercel settings ya!',
    likes: 8,
    alignRight: true,
    imagePath: 'assets/image/bambang.png',
  ),
  ForumCommentModel(
    name: 'Wahyu',
    time: '30 menit yang lalu',
    comment:
        'Kalau mau yang benar-benar pure dari GitHub, bisa pakai GitHub Pages. Kamu butuh package gh-pages.',
    code:
        '# package.json\n\n"scripts": {\n  "predeploy": "npm run build",\n  "deploy": "gh-pages -d build"\n}',
    likes: 15,
    lightCode: true,
    imagePath: 'assets/image/wahyu.png',
  ),
];

const List<MentorModel> mentors = [
  MentorModel(
    name: 'Budi',
    role: 'Principal Product Designer',
    status: 'TERSEDIA',
    isAvailable: true,
    skills: ['UI/UX Strategy', 'Design Ops'],
    imagePath: 'assets/image/mentor_budi.png',
  ),
  MentorModel(
    name: 'Rudi',
    role: 'Cloud Architect Lead',
    status: 'SIBUK',
    isAvailable: false,
    skills: ['AWS/Azure', 'Kubernetes'],
    imagePath: 'assets/image/mentor_rudi.png',
  ),
  MentorModel(
    name: 'Gilang',
    role: 'Fullstack Engineer',
    status: 'TERSEDIA',
    isAvailable: true,
    skills: ['React & Node', 'System Design'],
    imagePath: 'assets/image/mentor_gilang.png',
  ),
];


