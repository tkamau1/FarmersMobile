// lib/screens/expert_advice_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_expert_data_provider.dart';

class ExpertAdviceScreen extends StatefulWidget {
  final List<Map<String, String>> experts;
  final List<Map<String, String>> forumPosts;

  ExpertAdviceScreen({super.key})
      : experts = MockExpertDataProvider.getExperts(),
        forumPosts = MockExpertDataProvider.getForumPosts();

  @override
  _ExpertAdviceScreenState createState() => _ExpertAdviceScreenState();
}

class _ExpertAdviceScreenState extends State<ExpertAdviceScreen> {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expert Advice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildConsultationSection(context),
              const SizedBox(height: 20),
              _buildCommunityForumSection(),
              const SizedBox(height: 20),
              _buildNewPostForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConsultationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Consultation',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...widget.experts.map((expert) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(expert['name']!),
              subtitle: Text('Specialty: ${expert['specialty']}'),
              onTap: () {
                _showConsultationOptions(context, expert);
              },
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCommunityForumSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Community Forum',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        widget.forumPosts.isEmpty
            ? const Center(
          child: Text(
            'No forum posts yet. Start a discussion below!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        )
            : Column(
          children: widget.forumPosts.map((post) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                leading: const Icon(Icons.forum, color: Colors.green),
                title: Text(post['author']!),
                subtitle: Text(post['content']!),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildNewPostForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create a New Post',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _postController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Write your post...',
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (_postController.text.isNotEmpty) {
              setState(() {
                widget.forumPosts.add({
                  'author': 'Farmer', // This could be dynamic based on the logged-in user
                  'content': _postController.text,
                });
                _postController.clear();
              });
            }
          },
          child: const Text('Post'),
        ),
      ],
    );
  }

  void _showConsultationOptions(BuildContext context, Map<String, String> expert) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Consult with ${expert['name']}',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chat', arguments: expert);
                },
                child: const Text('Start Chat'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/video-call', arguments: expert);
                },
                child: const Text('Start Video Call'),
              ),
            ],
          ),
        );
      },
    );
  }
}
