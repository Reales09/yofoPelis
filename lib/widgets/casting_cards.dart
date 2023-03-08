import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      color: Colors.red,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => _CastCard(),
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALcAAAETCAMAAABDSmfhAAAANlBMVEXMzMzLy8uUlJTIyMjPz8+ampqbm5uXl5ejo6PFxcW+vr6enp6mpqasrKyvr6+pqam4uLi0tLSfTpDKAAACSElEQVR4nO3W3W7bMAyGYYn6l2xLvv+bHekkW7Id9GjzgL4PWlRQ1OILQ1N1DgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC+o9BXi49Ff+10/3EktvXc8a8z/vcz/1qrIsXCdF0clqVtInt4P9NFZLMdP3RhO17PjDuDx0OOJTk6f5SziobzS44p/f1MlXOWdR1+Ls5y7HLG22I7N6XFVLzWfQvLMoVZW0/nWzHjyLFbylhLbLLrYi/NSb0xt99HiyVrL4zd97Jrm4wt9DG18m1535seWl1zH9GFMZy3uH7L+lvpznq35pts0fV8+J7mldtbdo1bjpUfhW9nWVFfqs6Xqp/JNkLM6cbYzprVeqCnQ7/1oWtZc9equcNe0rR6u1CzLVrW3KlaU9UQR7p3ovhRNGQvh2tJe6Cl+cztTinXhNEGSTZh9C1Z7vDKHb74y39VXPakWb39r3oPy61ts+dlwX3brz551TvUcXu9fRXrhff+Do/+bkcLpw1Ee1uyW9n/n/6Oq0z7aSPEekVrWZ/zxNk015pqeBt/1lHZBXuI/ZZ0now754nfSovRbskaTrtugk7GXtZbD4QyH3MwbuIei0NakHln7p7znNbgp2zZ7ku3pI7P+zLJHOm6JmUb1z8FK9Uq66bIxs9SitgNYlPvShuO8lFu/Sz0xGmLuEu5bne96K3uN4qXa+WfQeL19XEoPHd+vvTnGQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4Pn4ATIYRvDLVvEgAAAAASUVORK5CYII='),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'actor.name addada fa',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
