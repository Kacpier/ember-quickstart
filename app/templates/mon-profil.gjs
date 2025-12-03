import SideBar from 'ember-quickstart/components/side-bar';
import ProfileHeader from 'ember-quickstart/components/profile-header';
import ProfileAbout from 'ember-quickstart/components/profile-about';
import ProfileExperience from 'ember-quickstart/components/profile-experience';
import ProfileContact from 'ember-quickstart/components/profile-contact';
import ProfileSkills from 'ember-quickstart/components/profile-skills';

import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { array, hash } from '@ember/helper';

export default class MonProfil extends Component {
  @tracked profile = {
    coverUrl: 'https://placehold.co/1200x340',
    avatarUrl: 'https://placehold.co/140x140',
    name: 'Jean Michel',
    role: 'Informaticien',
    status: 'Micro-entrepreneur',
    location: 'Paris, France',
    connections: '247',
    about:
      'Passionné par le développement web et les technologies innovantes. Spécialisé en React, Node.js et architecture cloud.',
    experienceTitle: 'Développeur Full Stack Senior',
    experienceCompany: 'Tech Innovators',
    experiencePeriod: '2021 – Présent',
    experienceDetails: "Développement d'applications web complexes et gestion d'équipe.",
    email: 'jean.michel@example.com',
    phone: '+33 6 12 34 56 78',
    website: 'www.jeanmichel.dev',
    linkedin: 'linkedin.com/in/jeanmichel',
    skillsString: 'React, TypeScript, Node.js, PostgreSQL, AWS, Docker, GraphQL, Tailwind CSS',
    skills: ['React', 'TypeScript', 'Node.js', 'PostgreSQL', 'AWS', 'Docker', 'GraphQL', 'Tailwind CSS'],
  };

  @action updateProfile(updated) {
    const skillsString = updated.skillsString ?? this.profile.skillsString;
    const skills = skillsString
      .split(',')
      .map((s) => s.trim())
      .filter(Boolean);

    this.profile = {
      ...this.profile,
      ...updated,
      skillsString,
      skills,
    };
  }

  <template>
    <div class="mon-profil">
      <div class="mon-profil__container">
        <ProfileHeader
          @coverUrl={{this.profile.coverUrl}}
          @avatarUrl={{this.profile.avatarUrl}}
          @name={{this.profile.name}}
          @role={{this.profile.role}}
          @status={{this.profile.status}}
          @location={{this.profile.location}}
          @connections={{this.profile.connections}}
          @about={{this.profile.about}}
          @experienceTitle={{this.profile.experienceTitle}}
          @experienceCompany={{this.profile.experienceCompany}}
          @experiencePeriod={{this.profile.experiencePeriod}}
          @experienceDetails={{this.profile.experienceDetails}}
          @email={{this.profile.email}}
          @phone={{this.profile.phone}}
          @website={{this.profile.website}}
          @linkedin={{this.profile.linkedin}}
          @skillsString={{this.profile.skillsString}}
          @coverActionLabel="Modifier la couverture"
          @profileActionLabel="Modifier le profil"
          @onSave={{this.updateProfile}}
        />

        <div class="mon-profil__grid">
          <div class="mon-profil__col mon-profil__col--main">
            <ProfileAbout
              @title="À propos"
              @description={{this.profile.about}}
            />
            <ProfileExperience
              @title="Expérience professionnelle"
              @experiences={{array
                (hash
                  title=this.profile.experienceTitle
                  company=this.profile.experienceCompany
                  period=this.profile.experiencePeriod
                  details=this.profile.experienceDetails
                )
              }}
            />
          </div>

          <div class="mon-profil__col mon-profil__col--side">
            <ProfileContact
              @title="Informations de contact"
              @email={{this.profile.email}}
              @phone={{this.profile.phone}}
              @website={{this.profile.website}}
              @linkedin={{this.profile.linkedin}}
            />
            <ProfileSkills
              @title="Compétences"
              @skills={{this.profile.skills}}
            />
          </div>
        </div>
      </div>
    </div>
  </template>
}
