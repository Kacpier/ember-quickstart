const DEFAULT_POSTS = [
  {
    author: 'Emma Petit',
    title: 'Marketing Manager • Growth Agency',
    time: 'Il y a 1 j',
    avatar: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=200',
    text:
      'Nouvelle stratégie de contenu pour 2024 ! Focus sur l’authenticité et l’engagement communautaire. Quelles sont vos meilleures pratiques ? 📢',
    tags: ['Marketing', 'Stratégie', 'Contenu'],
    likes: 35,
    commentsCount: 12,
    shares: 8,
    liked: false,
  },
  {
    author: 'Paul Rousseau',
    title: 'DevOps Engineer • Cloud Systems',
    time: 'Il y a 4 j',
    avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
    text:
      'Migration réussie vers Kubernetes ! Le déploiement est maintenant 3x plus rapide. Voici les leçons apprises… 🚀',
    tags: ['DevOps', 'Kubernetes', 'Cloud'],
    likes: 28,
    commentsCount: 9,
    shares: 6,
    liked: false,
  },
  {
    author: 'Julie Moreau',
    title: 'UX Researcher',
    time: 'Il y a 12 j',
    avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200',
    text:
      'Webinaire gratuit sur la recherche utilisateur ! Inscrivez-vous maintenant pour les dernières places disponibles. 🎯',
    tags: ['UX', 'Formation', 'Webinaire', 'Événement'],
    likes: 45,
    commentsCount: 18,
    shares: 15,
    liked: false,
  },
  {
    author: 'Marie Dubois',
    title: 'Responsable RH • Innovate Inc',
    time: 'Il y a 14 j',
    avatar: 'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?w=200',
    text:
      'Nous recherchons un UX Designer passionné(e) pour rejoindre notre équipe ! CDI, remote possible. Expérience en design thinking requise. Postulez dès maintenant ! 👋',
    tags: ['Recrutement', 'UX Design', 'Remote', "Offre d'emploi"],
    likes: 18,
    commentsCount: 6,
    shares: 22,
    liked: false,
  },
  {
    author: 'Lucas Bernard',
    title: 'Product Manager',
    time: 'Il y a 16 j',
    avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
    text: '',
    tags: ['Agilité', 'Management', 'Productivité'],
    isPoll: true,
    poll: {
      question: 'Quelle méthodologie agile préférez-vous pour gérer vos projets ?',
      options: ['Scrum', 'Kanban', 'Lean', 'Autre'],
    },
    likes: 12,
    commentsCount: 23,
    shares: 2,
    liked: false,
  },
  {
    author: 'Sophie Laurent',
    title: 'Cheffe de projet digital • TechCorp',
    time: 'Il y a 2h',
    avatar: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=200',
    text:
      "Excellente conférence sur l'IA et l'avenir du travail ! Les opportunités sont immenses pour notre secteur. Qui était présent ? 🚀",
    tags: ['IA', 'Innovation', 'Futur du travail'],
    image:
      'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=1200&auto=format&fit=crop&q=80',
    likes: 24,
    commentsCount: 8,
    comments: [
      { author: 'Thomas', text: 'J’y étais, super keynote !', time: 'Il y a 1h' },
      { author: 'Marie', text: 'Les démos étaient incroyables.', time: 'Il y a 30min' },
    ],
    shares: 3,
    liked: false,
  },
  {
    author: 'Thomas Martin',
    title: 'Développeur Full Stack • OpenSourceLab',
    time: 'Il y a 5h',
    avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
    text: 'Nouveau projet open source ! Venez contribuer sur GitHub 🤖',
    tags: ['Open Source', 'Dev', 'Collaboration'],
    image:
      'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?w=1200&auto=format&fit=crop&q=80',
    likes: 12,
    commentsCount: 2,
    comments: [
      { author: 'Sophie', text: 'Hâte de contribuer !', time: 'Il y a 3h' },
    ],
    shares: 1,
    liked: false,
  },
];

export default DEFAULT_POSTS;
