import 'package:flutter/material.dart';

class ProperiteItemWidget extends StatelessWidget {
  const ProperiteItemWidget({
    required this.title,
    required this.location,
    required this.price,
    required this.beds,
    required this.baths,
    required this.area,
    this.isFeatured = false,
    this.onTap,
    super.key,
  });

  final String title;
  final String location;
  final int price;
  final int beds;
  final int baths;
  final int area;
  final bool isFeatured;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(22),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFFE5E7EB)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFCEE7D2), Color(0xFF6FAF7B)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 14,
                        left: 14,
                        child: _Tag(
                          text: isFeatured ? 'Featured' : 'Verified',
                          backgroundColor:
                              isFeatured
                                  ? const Color(0xFF16A34A)
                                  : const Color(0xFF2563EB),
                        ),
                      ),
                      const Positioned(
                        top: 14,
                        right: 14,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.bookmark_border,
                            color: Color(0xFF0F172A),
                            size: 18,
                          ),
                        ),
                      ),
                      const Center(
                        child: Icon(
                          Icons.home_work_rounded,
                          size: 64,
                          color: Color(0x4DFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$$price / month',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF0F172A),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: const Color(0xFF111827),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Color(0xFF6B7280),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              location,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _InfoPill(
                              icon: Icons.bed_outlined,
                              value: '$beds Beds',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _InfoPill(
                              icon: Icons.bathtub_outlined,
                              value: '$baths Baths',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _InfoPill(
                              icon: Icons.square_foot_outlined,
                              value: '$area sqft',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1F7A3E),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text('View Details'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text, required this.backgroundColor});

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF374151)),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF374151),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
